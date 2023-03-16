#ifndef BANKA_V1_SITEFUNCTIONALITY_H
#define BANKA_V1_SITEFUNCTIONALITY_H

#include <iostream>
#include <cstring>
#include <sys/socket.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <string>
#include <cstdlib>

namespace bank::services
{
    // purely virtual class
    class SiteFunctionality
    {
        public:
                virtual void run() = 0;
                virtual std::string geHostIpAddress() = 0;
                ~SiteFunctionality() = default;
    };
}

#endif //BANKA_V1_SITEFUNCTIONALITY_H
