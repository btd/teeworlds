/* (c) Magnus Auvinen. See licence.txt in the root of the distribution for more information. */
/* If you are missing that file, acquire a complete release at teeworlds.com.                */
#ifndef ENGINE_KERNEL_H
#define ENGINE_KERNEL_H

#include <base/system.h>

#include <boost/smart_ptr.hpp>

#define SINGLETON_DEFAULT_DEF(className) \
    private: \
        static boost::shared_ptr < className > g_instance; \
    public: \
        static boost::shared_ptr < className > instance();
        
#define SINGLETON_SET_DEF(className) \
    private: \
        static bool g_inited; \
    public: \
        static void set(className * pStorage);

#endif
