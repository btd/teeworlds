/* (c) Magnus Auvinen. See licence.txt in the root of the distribution for more information. */
/* If you are missing that file, acquire a complete release at teeworlds.com.                */
#include <engine/graphics.h>
#include <engine/keys.h>
#include <engine/demo.h>
#include <engine/serverbrowser.h>
#include <engine/shared/config.h>
#include <engine/storage.h>

#include <game/layers.h>
#include <game/client/gameclient.h>
#include <game/client/component.h>
#include <game/client/render.h>

#include <game/client/components/camera.h>
#include <game/client/components/mapimages.h>


#include "maplayers.h"

CMapLayers::CMapLayers(int t)
{
	m_Type = t;
	m_pLayers = 0;
}

void CMapLayers::OnInit()
{
	m_pLayers = Layers();
}


void CMapLayers::MapScreenToGroup(float CenterX, float CenterY, CMapItemGroup *pGroup)
{
	float Points[4];
	RenderTools()->MapscreenToWorld(CenterX, CenterY, pGroup->m_ParallaxX/100.0f, pGroup->m_ParallaxY/100.0f,
		pGroup->m_OffsetX, pGroup->m_OffsetY, IEngineGraphics::instance()->ScreenAspect(), 1.0f, Points);
	IEngineGraphics::instance()->MapScreen(Points[0], Points[1], Points[2], Points[3]);
}

void CMapLayers::EnvelopeEval(float TimeOffset, int Env, float *pChannels, void *pUser)
{
	CMapLayers *pThis = (CMapLayers *)pUser;
	pChannels[0] = 0;
	pChannels[1] = 0;
	pChannels[2] = 0;
	pChannels[3] = 0;

	CEnvPoint *pPoints = 0;

	{
		int Start, Num;
		IEngineMap::instance()->GetType(MAPITEMTYPE_ENVPOINTS, &Start, &Num);
		if(Num)
			pPoints = (CEnvPoint *)IEngineMap::instance()->GetItem(Start, 0, 0);
	}

	int Start, Num;
	IEngineMap::instance()->GetType(MAPITEMTYPE_ENVELOPE, &Start, &Num);

	if(Env >= Num)
		return;

	CMapItemEnvelope *pItem = (CMapItemEnvelope *)IEngineMap::instance()->GetItem(Start+Env, 0, 0);

	if(IClient::instance()->State() == IClient::STATE_DEMOPLAYBACK)
	{
		const IDemoPlayer::CInfo *pInfo = IDemoPlayer::instance()->BaseInfo();
		static float Time = 0;
		static float LastLocalTime = IClient::instance()->LocalTime();

		if(!pInfo->m_Paused)
			Time += (IClient::instance()->LocalTime()-LastLocalTime)*pInfo->m_Speed;

		pThis->RenderTools()->RenderEvalEnvelope(pPoints+pItem->m_StartPoint, pItem->m_NumPoints, 4, Time+TimeOffset, pChannels);

		LastLocalTime = IClient::instance()->LocalTime();
	}
	else
		pThis->RenderTools()->RenderEvalEnvelope(pPoints+pItem->m_StartPoint, pItem->m_NumPoints, 4, IClient::instance()->LocalTime()+TimeOffset, pChannels);
}

void CMapLayers::OnRender()
{
	if(IClient::instance()->State() != IClient::STATE_ONLINE && IClient::instance()->State() != IClient::STATE_DEMOPLAYBACK)
		return;

	CUIRect Screen;
	IEngineGraphics::instance()->GetScreen(&Screen.x, &Screen.y, &Screen.w, &Screen.h);

	vec2 Center = m_pClient->m_pCamera->m_Center;
	//float center_x = gameclient.camera->center.x;
	//float center_y = gameclient.camera->center.y;

	bool PassedGameLayer = false;

	for(int g = 0; g < m_pLayers->NumGroups(); g++)
	{
		CMapItemGroup *pGroup = m_pLayers->GetGroup(g);

		if(!g_Config.m_GfxNoclip && pGroup->m_Version >= 2 && pGroup->m_UseClipping)
		{
			// set clipping
			float Points[4];
			MapScreenToGroup(Center.x, Center.y, m_pLayers->GameGroup());
			IEngineGraphics::instance()->GetScreen(&Points[0], &Points[1], &Points[2], &Points[3]);
			float x0 = (pGroup->m_ClipX - Points[0]) / (Points[2]-Points[0]);
			float y0 = (pGroup->m_ClipY - Points[1]) / (Points[3]-Points[1]);
			float x1 = ((pGroup->m_ClipX+pGroup->m_ClipW) - Points[0]) / (Points[2]-Points[0]);
			float y1 = ((pGroup->m_ClipY+pGroup->m_ClipH) - Points[1]) / (Points[3]-Points[1]);

			IEngineGraphics::instance()->ClipEnable((int)(x0*IEngineGraphics::instance()->ScreenWidth()), (int)(y0*IEngineGraphics::instance()->ScreenHeight()),
				(int)((x1-x0)*IEngineGraphics::instance()->ScreenWidth()), (int)((y1-y0)*IEngineGraphics::instance()->ScreenHeight()));
		}

		MapScreenToGroup(Center.x, Center.y, pGroup);

		for(int l = 0; l < pGroup->m_NumLayers; l++)
		{
			CMapItemLayer *pLayer = m_pLayers->GetLayer(pGroup->m_StartLayer+l);
			bool Render = false;
			bool IsGameLayer = false;

			if(pLayer == (CMapItemLayer*)m_pLayers->GameLayer())
			{
				IsGameLayer = true;
				PassedGameLayer = 1;
			}

			// skip rendering if detail layers if not wanted
			if(pLayer->m_Flags&LAYERFLAG_DETAIL && !g_Config.m_GfxHighDetail && !IsGameLayer)
				continue;

			if(m_Type == -1)
				Render = true;
			else if(m_Type == 0)
			{
				if(PassedGameLayer)
					return;
				Render = true;
			}
			else
			{
				if(PassedGameLayer && !IsGameLayer)
					Render = true;
			}

			if(Render && pLayer->m_Type == LAYERTYPE_TILES && IEngineInput::instance()->KeyPressed(KEY_LCTRL) && IEngineInput::instance()->KeyPressed(KEY_LSHIFT) && IEngineInput::instance()->KeyDown(KEY_KP0))
			{
				CMapItemLayerTilemap *pTMap = (CMapItemLayerTilemap *)pLayer;
				CTile *pTiles = (CTile *)IEngineMap::instance()->GetData(pTMap->m_Data);
				CServerInfo CurrentServerInfo;
				IClient::instance()->GetServerInfo(&CurrentServerInfo);
				char aFilename[256];
				str_format(aFilename, sizeof(aFilename), "dumps/tilelayer_dump_%s-%d-%d-%dx%d.txt", CurrentServerInfo.m_aMap, g, l, pTMap->m_Width, pTMap->m_Height);
				IOHANDLE File = IStorage::instance()->OpenFile(aFilename, IOFLAG_WRITE, IStorage::TYPE_SAVE);
				if(File)
				{
					#if defined(CONF_FAMILY_WINDOWS)
						static const char Newline[] = "\r\n";
					#else
						static const char Newline[] = "\n";
					#endif
					for(int y = 0; y < pTMap->m_Height; y++)
					{
						for(int x = 0; x < pTMap->m_Width; x++)
							io_write(File, &(pTiles[y*pTMap->m_Width + x].m_Index), sizeof(pTiles[y*pTMap->m_Width + x].m_Index));
						io_write(File, Newline, sizeof(Newline)-1);
					}
					io_close(File);
				}
			}

			if(Render && !IsGameLayer)
			{
				//layershot_begin();

				if(pLayer->m_Type == LAYERTYPE_TILES)
				{
					CMapItemLayerTilemap *pTMap = (CMapItemLayerTilemap *)pLayer;
					if(pTMap->m_Image == -1)
						IEngineGraphics::instance()->TextureSet(-1);
					else
						IEngineGraphics::instance()->TextureSet(m_pClient->m_pMapimages->Get(pTMap->m_Image));

					CTile *pTiles = (CTile *)IEngineMap::instance()->GetData(pTMap->m_Data);
					IEngineGraphics::instance()->BlendNone();
					vec4 Color = vec4(pTMap->m_Color.r/255.0f, pTMap->m_Color.g/255.0f, pTMap->m_Color.b/255.0f, pTMap->m_Color.a/255.0f);
					RenderTools()->RenderTilemap(pTiles, pTMap->m_Width, pTMap->m_Height, 32.0f, Color, TILERENDERFLAG_EXTEND|LAYERRENDERFLAG_OPAQUE);
					IEngineGraphics::instance()->BlendNormal();
					RenderTools()->RenderTilemap(pTiles, pTMap->m_Width, pTMap->m_Height, 32.0f, Color, TILERENDERFLAG_EXTEND|LAYERRENDERFLAG_TRANSPARENT);
				}
				else if(pLayer->m_Type == LAYERTYPE_QUADS)
				{
					CMapItemLayerQuads *pQLayer = (CMapItemLayerQuads *)pLayer;
					if(pQLayer->m_Image == -1)
						IEngineGraphics::instance()->TextureSet(-1);
					else
						IEngineGraphics::instance()->TextureSet(m_pClient->m_pMapimages->Get(pQLayer->m_Image));

					CQuad *pQuads = (CQuad *)IEngineMap::instance()->GetDataSwapped(pQLayer->m_Data);

					IEngineGraphics::instance()->BlendNone();
					RenderTools()->RenderQuads(pQuads, pQLayer->m_NumQuads, LAYERRENDERFLAG_OPAQUE, EnvelopeEval, this);
					IEngineGraphics::instance()->BlendNormal();
					RenderTools()->RenderQuads(pQuads, pQLayer->m_NumQuads, LAYERRENDERFLAG_TRANSPARENT, EnvelopeEval, this);
				}

				//layershot_end();
			}
		}
		if(!g_Config.m_GfxNoclip)
			IEngineGraphics::instance()->ClipDisable();
	}

	if(!g_Config.m_GfxNoclip)
		IEngineGraphics::instance()->ClipDisable();

	// reset the screen like it was before
	IEngineGraphics::instance()->MapScreen(Screen.x, Screen.y, Screen.w, Screen.h);
}

