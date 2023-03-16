#ifndef BANKA_V1_CURRENCY_H
#define BANKA_V1_CURRENCY_H

#include <string>

namespace bank::models
{
    class Currency
    {
        private:
                std::string* type;
                long double* amount;

        public:
                Currency(std::string* type, long double* amount);
                ~Currency();
    };

}
#endif //BANKA_V1_CURRENCY_H
