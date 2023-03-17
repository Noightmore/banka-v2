#ifndef BANKA_V1_BUSINESSLOGIC_H
#define BANKA_V1_BUSINESSLOGIC_H

#include "SiteFunctionality.h"
#include "../pages/PageGenerator.h"


namespace bank::services
{
    class BusinessLogic : public SiteFunctionality
    {
        private:
                std::string host_ip_address;
                //pages::PageGenerator* page_generator{};
                const std::string default_error_message = "error error";
        public:
            BusinessLogic();
            ~BusinessLogic() = default;

            void run() override;
            std::string geHostIpAddress() override;
    };
}


#endif //BANKA_V1_BUSINESSLOGIC_H
