cmake_minimum_required(VERSION 3.24)
project(banka_v2)

set(CMAKE_CXX_STANDARD 23)

add_executable(
        index.cgi
        src/main/main.cpp
        src/main/models/UserAccount.cpp
        src/main/models/headers/UserAccount.h
        src/main/models/Currency.cpp
        src/main/models/headers/Currency.h
        src/main/models/Bank.cpp
        src/main/models/headers/Bank.h
        src/main/services/SiteFunctionality.h
        src/main/services/BusinessLogic.cpp
        src/main/services/BusinessLogic.h
        src/main/pages/PageGenerator.cpp
        src/main/pages/PageGenerator.h
        src/main/models/ExchangeRates.cpp
        src/main/models/headers/ExchangeRates.h)
