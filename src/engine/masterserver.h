/* (c) Magnus Auvinen. See licence.txt in the root of the distribution for more information. */
/* If you are missing that file, acquire a complete release at teeworlds.com.                */
#ifndef ENGINE_MASTERSERVER_H
#define ENGINE_MASTERSERVER_H

#include "kernel.h"

class IMasterServer 
{
	
public:

	enum
	{
		MAX_MASTERSERVERS=4
	};

	virtual void Init() = 0;
	virtual void SetDefault() = 0;
	virtual int Load() = 0;
	virtual int Save() = 0;

	virtual int RefreshAddresses(int Nettype) = 0;
	virtual void Update() = 0;
	virtual int IsRefreshing() = 0;
	virtual void DumpServers() = 0;
	virtual NETADDR GetAddr(int Index) = 0;
	virtual const char *GetName(int Index) = 0;
	virtual bool IsValid(int Index) = 0;
};

class IEngineMasterServer : public IMasterServer
{
	SINGLETON_DEFAULT_DEF(IMasterServer)
public:
};

extern IEngineMasterServer *CreateEngineMasterServer();

#endif



