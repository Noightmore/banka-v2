#include "headers/Currency.h"

namespace bank::models
{

    Currency::Currency(std::string *type, long double *amount)
    {
        this->type = type;
        this->amount = amount;
    }

    Currency::~Currency()
    {
        delete this->type;
        delete this->amount;
    }


}