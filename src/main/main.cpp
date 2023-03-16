#include "services/SiteFunctionality.h"
#include "services/BusinessLogic.h"

int main()
{
        bank::services::SiteFunctionality* website;
        website = new bank::services::BusinessLogic();
        website->run();
        return 0;
}
