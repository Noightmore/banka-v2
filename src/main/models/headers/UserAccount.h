#ifndef BANKA_V1_USERACCOUNT_H
#define BANKA_V1_USERACCOUNT_H

#include <vector>
#include "Currency.h"

namespace bank::models
{
    class UserAccount
    {
        private:
                std::vector<Currency*>* users_currencies;

        public:
                UserAccount();
                ~UserAccount();
    };
}

#endif //BANKA_V1_USERACCOUNT_H
