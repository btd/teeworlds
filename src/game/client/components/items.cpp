/* (c) Magnus Auvinen. See licence.txt in the root of the distribution for more information. */
/* If you are missing that file, acquire a complete release at teeworlds.com.                */
#include <engine/graphics.h>
#include <engine/demo.h>
#include <game/generated/protocol.h>
#include <game/generated/client_data.h>

#include <game/gamecore.h> // get_angle
#include <game/client/gameclient.h>
#include <game/client/ui.h>
#include <game/client/render.h>

#include <game/client/components/flow.h>
#include <game/client/components/effects.h>

#include "items.h"

void CItems::OnReset()
{
	ExtraProjectilesNum = 0;
}

void CItems::RenderProjectile(const CNetObj_Projectile *pCurrent, int ItemID)
{

	// get positions
	float Curvature = 0;
	float Speed = 0;
	if(pCurrent->m_Type == WEAPON_GRENADE)
	{
		Curvature = m_pClient->m_Tuning.m_GrenadeCurvature;
		Speed = m_pClient->m_Tuning.m_GrenadeSpeed;
	}
	else if(pCurrent->m_Type == WEAPON_SHOTGUN)
	{
		Curvature = m_pClient->m_Tuning.m_ShotgunCurvature;
		Speed = m_pClient->m_Tuning.m_ShotgunSpeed;
	}
	else if(pCurrent->m_Type == WEAPON_GUN)
	{
		Curvature = m_pClient->m_Tuning.m_GunCurvature;
		Speed = m_pClient->m_Tuning.m_GunSpeed;
	}

	float Ct = (IClient::instance()->PrevGameTick()-pCurrent->m_StartTick)/(float)SERVER_TICK_SPEED + IClient::instance()->GameTickTime();
	if(Ct < 0)
		return; // projectile havn't been shot yet

	vec2 StartPos(pCurrent->m_X, pCurrent->m_Y);
	vec2 StartVel(pCurrent->m_VelX/100.0f, pCurrent->m_VelY/100.0f);
	vec2 Pos = CalcPos(StartPos, StartVel, Curvature, Speed, Ct);
	vec2 PrevPos = CalcPos(StartPos, StartVel, Curvature, Speed, Ct-0.001f);


	IEngineGraphics::instance()->TextureSet(g_pData->m_aImages[IMAGE_GAME].m_Id);
	IEngineGraphics::instance()->QuadsBegin();

	RenderTools()->SelectSprite(g_pData->m_Weapons.m_aId[clamp(pCurrent->m_Type, 0, NUM_WEAPONS-1)].m_pSpriteProj);
	vec2 Vel = Pos-PrevPos;
	//vec2 pos = mix(vec2(prev->x, prev->y), vec2(current->x, current->y), IClient::instance()->IntraGameTick());


	// add particle for this projectile
	if(pCurrent->m_Type == WEAPON_GRENADE)
	{
		m_pClient->m_pEffects->SmokeTrail(Pos, Vel*-1);
		m_pClient->m_pFlow->Add(Pos, Vel*1000*IClient::instance()->FrameTime(), 10.0f);

		if(IClient::instance()->State() == IClient::STATE_DEMOPLAYBACK)
		{
			const IDemoPlayer::CInfo *pInfo = IDemoPlayer::instance()->BaseInfo();
			static float Time = 0;
			static float LastLocalTime = IClient::instance()->LocalTime();

			if(!pInfo->m_Paused)
				Time += (IClient::instance()->LocalTime()-LastLocalTime)*pInfo->m_Speed;

			IEngineGraphics::instance()->QuadsSetRotation(Time*pi*2*2 + ItemID);

			LastLocalTime = IClient::instance()->LocalTime();
		}
		else
			IEngineGraphics::instance()->QuadsSetRotation(IClient::instance()->LocalTime()*pi*2*2 + ItemID);
	}
	else
	{
		m_pClient->m_pEffects->BulletTrail(Pos);
		m_pClient->m_pFlow->Add(Pos, Vel*1000*IClient::instance()->FrameTime(), 10.0f);

		if(length(Vel) > 0.00001f)
			IEngineGraphics::instance()->QuadsSetRotation(GetAngle(Vel));
		else
			IEngineGraphics::instance()->QuadsSetRotation(0);

	}

	IGraphics::CQuadItem QuadItem(Pos.x, Pos.y, 32, 32);
	IEngineGraphics::instance()->QuadsDraw(&QuadItem, 1);
	IEngineGraphics::instance()->QuadsSetRotation(0);
	IEngineGraphics::instance()->QuadsEnd();
}

void CItems::RenderPickup(const CNetObj_Pickup *pPrev, const CNetObj_Pickup *pCurrent)
{
	IEngineGraphics::instance()->TextureSet(g_pData->m_aImages[IMAGE_GAME].m_Id);
	IEngineGraphics::instance()->QuadsBegin();
	vec2 Pos = mix(vec2(pPrev->m_X, pPrev->m_Y), vec2(pCurrent->m_X, pCurrent->m_Y), IClient::instance()->IntraGameTick());
	float Angle = 0.0f;
	float Size = 64.0f;
	if (pCurrent->m_Type == POWERUP_WEAPON)
	{
		Angle = 0; //-pi/6;//-0.25f * pi * 2.0f;
		RenderTools()->SelectSprite(g_pData->m_Weapons.m_aId[clamp(pCurrent->m_Subtype, 0, NUM_WEAPONS-1)].m_pSpriteBody);
		Size = g_pData->m_Weapons.m_aId[clamp(pCurrent->m_Subtype, 0, NUM_WEAPONS-1)].m_VisualSize;
	}
	else
	{
		const int c[] = {
			SPRITE_PICKUP_HEALTH,
			SPRITE_PICKUP_ARMOR,
			SPRITE_PICKUP_WEAPON,
			SPRITE_PICKUP_NINJA
			};
		RenderTools()->SelectSprite(c[pCurrent->m_Type]);

		if(c[pCurrent->m_Type] == SPRITE_PICKUP_NINJA)
		{
			m_pClient->m_pEffects->PowerupShine(Pos, vec2(96,18));
			Size *= 2.0f;
			Pos.x -= 10.0f;
		}
	}

	IEngineGraphics::instance()->QuadsSetRotation(Angle);

	float Offset = Pos.y/32.0f + Pos.x/32.0f;
	if(IClient::instance()->State() == IClient::STATE_DEMOPLAYBACK)
	{
		const IDemoPlayer::CInfo *pInfo = IDemoPlayer::instance()->BaseInfo();
		static float Time = 0;
		static float LastLocalTime = IClient::instance()->LocalTime();

		if(!pInfo->m_Paused)
			Time += (IClient::instance()->LocalTime()-LastLocalTime)*pInfo->m_Speed;

		Pos.x += cosf(Time*2.0f+Offset)*2.5f;
		Pos.y += sinf(Time*2.0f+Offset)*2.5f;

		LastLocalTime = IClient::instance()->LocalTime();
	}
	else
	{
		Pos.x += cosf(IClient::instance()->LocalTime()*2.0f+Offset)*2.5f;
		Pos.y += sinf(IClient::instance()->LocalTime()*2.0f+Offset)*2.5f;
	}
	RenderTools()->DrawSprite(Pos.x, Pos.y, Size);
	IEngineGraphics::instance()->QuadsEnd();
}

void CItems::RenderFlag(const CNetObj_Flag *pPrev, const CNetObj_Flag *pCurrent, const CNetObj_GameData *pPrevGameData, const CNetObj_GameData *pCurGameData)
{
	float Angle = 0.0f;
	float Size = 42.0f;

	IEngineGraphics::instance()->BlendNormal();
	IEngineGraphics::instance()->TextureSet(g_pData->m_aImages[IMAGE_GAME].m_Id);
	IEngineGraphics::instance()->QuadsBegin();

	if(pCurrent->m_Team == TEAM_RED)
		RenderTools()->SelectSprite(SPRITE_FLAG_RED);
	else
		RenderTools()->SelectSprite(SPRITE_FLAG_BLUE);

	IEngineGraphics::instance()->QuadsSetRotation(Angle);

	vec2 Pos = mix(vec2(pPrev->m_X, pPrev->m_Y), vec2(pCurrent->m_X, pCurrent->m_Y), IClient::instance()->IntraGameTick());

	if(pCurGameData)
	{
		// make sure that the flag isn't interpolated between capture and return
		if(pPrevGameData &&
			((pCurrent->m_Team == TEAM_RED && pPrevGameData->m_FlagCarrierRed != pCurGameData->m_FlagCarrierRed) ||
			(pCurrent->m_Team == TEAM_BLUE && pPrevGameData->m_FlagCarrierBlue != pCurGameData->m_FlagCarrierBlue)))
			Pos = vec2(pCurrent->m_X, pCurrent->m_Y);

		// make sure to use predicted position if we are the carrier
		if(m_pClient->m_Snap.m_pLocalInfo &&
			((pCurrent->m_Team == TEAM_RED && pCurGameData->m_FlagCarrierRed == m_pClient->m_Snap.m_LocalClientID) ||
			(pCurrent->m_Team == TEAM_BLUE && pCurGameData->m_FlagCarrierBlue == m_pClient->m_Snap.m_LocalClientID)))
			Pos = m_pClient->m_LocalCharacterPos;
	}

	IGraphics::CQuadItem QuadItem(Pos.x, Pos.y-Size*0.75f, Size, Size*2);
	IEngineGraphics::instance()->QuadsDraw(&QuadItem, 1);
	IEngineGraphics::instance()->QuadsEnd();
}


void CItems::RenderLaser(const struct CNetObj_Laser *pCurrent)
{
	vec2 Pos = vec2(pCurrent->m_X, pCurrent->m_Y);
	vec2 From = vec2(pCurrent->m_FromX, pCurrent->m_FromY);
	vec2 Dir = normalize(Pos-From);

	float Ticks = IClient::instance()->GameTick() + IClient::instance()->IntraGameTick() - pCurrent->m_StartTick;
	float Ms = (Ticks/50.0f) * 1000.0f;
	float a = Ms / m_pClient->m_Tuning.m_LaserBounceDelay;
	a = clamp(a, 0.0f, 1.0f);
	float Ia = 1-a;

	vec2 Out, Border;

	IEngineGraphics::instance()->BlendNormal();
	IEngineGraphics::instance()->TextureSet(-1);
	IEngineGraphics::instance()->QuadsBegin();

	//vec4 inner_color(0.15f,0.35f,0.75f,1.0f);
	//vec4 outer_color(0.65f,0.85f,1.0f,1.0f);

	// do outline
	vec4 OuterColor(0.075f, 0.075f, 0.25f, 1.0f);
	IEngineGraphics::instance()->SetColor(OuterColor.r, OuterColor.g, OuterColor.b, 1.0f);
	Out = vec2(Dir.y, -Dir.x) * (7.0f*Ia);

	IGraphics::CFreeformItem Freeform(
			From.x-Out.x, From.y-Out.y,
			From.x+Out.x, From.y+Out.y,
			Pos.x-Out.x, Pos.y-Out.y,
			Pos.x+Out.x, Pos.y+Out.y);
	IEngineGraphics::instance()->QuadsDrawFreeform(&Freeform, 1);

	// do inner
	vec4 InnerColor(0.5f, 0.5f, 1.0f, 1.0f);
	Out = vec2(Dir.y, -Dir.x) * (5.0f*Ia);
	IEngineGraphics::instance()->SetColor(InnerColor.r, InnerColor.g, InnerColor.b, 1.0f); // center

	Freeform = IGraphics::CFreeformItem(
			From.x-Out.x, From.y-Out.y,
			From.x+Out.x, From.y+Out.y,
			Pos.x-Out.x, Pos.y-Out.y,
			Pos.x+Out.x, Pos.y+Out.y);
	IEngineGraphics::instance()->QuadsDrawFreeform(&Freeform, 1);

	IEngineGraphics::instance()->QuadsEnd();

	// render head
	{
		IEngineGraphics::instance()->BlendNormal();
		IEngineGraphics::instance()->TextureSet(g_pData->m_aImages[IMAGE_PARTICLES].m_Id);
		IEngineGraphics::instance()->QuadsBegin();

		int Sprites[] = {SPRITE_PART_SPLAT01, SPRITE_PART_SPLAT02, SPRITE_PART_SPLAT03};
		RenderTools()->SelectSprite(Sprites[IClient::instance()->GameTick()%3]);
		IEngineGraphics::instance()->QuadsSetRotation(IClient::instance()->GameTick());
		IEngineGraphics::instance()->SetColor(OuterColor.r, OuterColor.g, OuterColor.b, 1.0f);
		IGraphics::CQuadItem QuadItem(Pos.x, Pos.y, 24, 24);
		IEngineGraphics::instance()->QuadsDraw(&QuadItem, 1);
		IEngineGraphics::instance()->SetColor(InnerColor.r, InnerColor.g, InnerColor.b, 1.0f);
		QuadItem = IGraphics::CQuadItem(Pos.x, Pos.y, 20, 20);
		IEngineGraphics::instance()->QuadsDraw(&QuadItem, 1);
		IEngineGraphics::instance()->QuadsEnd();
	}

	IEngineGraphics::instance()->BlendNormal();
}

void CItems::OnRender()
{
	if(IClient::instance()->State() < IClient::STATE_ONLINE)
		return;

	int Num = IClient::instance()->SnapNumItems(IClient::SNAP_CURRENT);
	for(int i = 0; i < Num; i++)
	{
		IClient::CSnapItem Item;
		const void *pData = IClient::instance()->SnapGetItem(IClient::SNAP_CURRENT, i, &Item);

		if(Item.m_Type == NETOBJTYPE_PROJECTILE)
		{
			RenderProjectile((const CNetObj_Projectile *)pData, Item.m_ID);
		}
		else if(Item.m_Type == NETOBJTYPE_PICKUP)
		{
			const void *pPrev = IClient::instance()->SnapFindItem(IClient::SNAP_PREV, Item.m_Type, Item.m_ID);
			if(pPrev)
				RenderPickup((const CNetObj_Pickup *)pPrev, (const CNetObj_Pickup *)pData);
		}
		else if(Item.m_Type == NETOBJTYPE_LASER)
		{
			RenderLaser((const CNetObj_Laser *)pData);
		}
	}

	// render flag
	for(int i = 0; i < Num; i++)
	{
		IClient::CSnapItem Item;
		const void *pData = IClient::instance()->SnapGetItem(IClient::SNAP_CURRENT, i, &Item);

		if(Item.m_Type == NETOBJTYPE_FLAG)
		{
			const void *pPrev = IClient::instance()->SnapFindItem(IClient::SNAP_PREV, Item.m_Type, Item.m_ID);
			if (pPrev)
			{
				const void *pPrevGameData = IClient::instance()->SnapFindItem(IClient::SNAP_PREV, NETOBJTYPE_GAMEDATA, m_pClient->m_Snap.m_GameDataSnapID);
				RenderFlag(static_cast<const CNetObj_Flag *>(pPrev), static_cast<const CNetObj_Flag *>(pData),
							static_cast<const CNetObj_GameData *>(pPrevGameData), m_pClient->m_Snap.m_pGameDataObj);
			}
		}
	}

	// render extra projectiles
	for(int i = 0; i < ExtraProjectilesNum; i++)
	{
		if(aExtraProjectiles[i].m_StartTick < IClient::instance()->GameTick())
		{
			aExtraProjectiles[i] = aExtraProjectiles[ExtraProjectilesNum-1];
			ExtraProjectilesNum--;
		}
		else
			RenderProjectile(&aExtraProjectiles[i], 0);
	}
}

void CItems::AddExtraProjectile(CNetObj_Projectile *pProj)
{
	if(ExtraProjectilesNum != MAX_EXTRA_PROJECTILES)
	{
		aExtraProjectiles[ExtraProjectilesNum] = *pProj;
		ExtraProjectilesNum++;
	}
}
