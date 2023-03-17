#ifndef BANKA_V1_PAGEGENERATOR_H
#define BANKA_V1_PAGEGENERATOR_H


#include <string>
#include <iostream>

// the logins page route should be http://localhost/cgi-bin/banka_v1.cgi
#define CURRENT_BANK_VERSION "banka_v2"
#define PAGE_ROUTE ("/cgi-bin/"+CURRENT_BANK_VERSION+".cgi")

namespace bank::pages
{
    // static class
    class PageGenerator
    {
        public:
                static void generateLoginPage(std::string &ipAddress);
                static void generateUserAccountPage(std::string &ipAddress);
                static void generateErrorPage(std::string &ipAddress, std::string &errorMessage);
            //PageGenerator();
            //~PageGenerator();
    };
}


#endif //BANKA_V1_PAGEGENERATOR_H
