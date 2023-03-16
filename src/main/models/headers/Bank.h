#ifndef BANKA_V1_BANK_H
#define BANKA_V1_BANK_H

#include <vector>
#include "UserAccount.h"
#include "ExchangeRates.h"

namespace bank::models
{
    class Bank
    {
        private:
            std::vector<UserAccount*>* users;
            std::vector<ExchangeRates*>* available_currencies_for_exchange;

    };
}

#endif //BANKA_V1_BANK_H
