/* (c) Magnus Auvinen. See licence.txt in the root of the distribution for more information. */
/* If you are missing that file, acquire a complete release at teeworlds.com.                */
#ifndef ENGINE_MAP_H
#define ENGINE_MAP_H

#include "kernel.h"




class IMap 
{
	
		
public:

    

	virtual void *GetData(int Index) = 0;
	virtual void *GetDataSwapped(int Index) = 0;
	virtual void UnloadData(int Index) = 0;
	virtual void *GetItem(int Index, int *Type, int *pID) = 0;
	virtual void GetType(int Type, int *pStart, int *pNum) = 0;
	virtual void *FindItem(int Type, int ID) = 0;
	virtual int NumItems() = 0;
};


class IEngineMap : public IMap
{
    SINGLETON_DEFAULT_DEF(IEngineMap)

public:
    
	virtual bool Load(const char *pMapName) = 0;
	virtual bool IsLoaded() = 0;
	virtual void Unload() = 0;
	virtual unsigned Crc() = 0;
};



#endif
