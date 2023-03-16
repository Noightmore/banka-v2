#include "BusinessLogic.h"

namespace bank::services
{

    std::string BusinessLogic::geHostIpAddress()
    {
            struct ifaddrs *ifap, *ifa;
            struct sockaddr_in *sa;
            char *addr;

            if (getifaddrs(&ifap) == -1)
            {
                    std::cerr << "Error getting network interfaces.\n";
                    return "";
            }

            for (ifa = ifap; ifa != nullptr; ifa = ifa->ifa_next)
            {
                    if (ifa->ifa_addr->sa_family != AF_INET) continue;

                    sa = (struct sockaddr_in*) ifa->ifa_addr;
                    addr = inet_ntoa(sa->sin_addr);

                    if (std::strcmp(addr, "127.0.0.1") == 0) continue;

                    // found a non-loopback address
                    std::string ip_address(addr);
                    freeifaddrs(ifap);
                    return ip_address;
            }

            freeifaddrs(ifap);
            std::cerr << "Error finding non-loopback address.\n";
            return "";
    }

    void BusinessLogic::run()
    {
            this->host_ip_address = this->geHostIpAddress();

            char* requestMethod = getenv("REQUEST_METHOD");

            if (requestMethod == nullptr)
            {
                    std::cerr << "Error getting request method.\n";
                    return;
            }

            if (std::strcmp(requestMethod, "GET") == 0)
            {
                    bank::pages::PageGenerator::generateLoginPage(this->host_ip_address);
                    return;
            }

            else if (std::strcmp(requestMethod, "POST") == 0)
            {
                    //bank::pages::PageGenerator::generateLoginPage(this->host_ip_address);
                    bank::pages::PageGenerator::generateUserAccountPage(this->host_ip_address);
                    return;
            }

            bank::pages::PageGenerator::generateErrorPage(this->host_ip_address,
                                                          const_cast<std::string &>(default_error_message));

    }

    BusinessLogic::BusinessLogic()
    {
            //this->page_generator = new pages::PageGenerator();
    }

}