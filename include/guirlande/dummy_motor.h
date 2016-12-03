#ifndef GUIRLANDE_DUMMY_MOTOR_H
#define GUIRLANDE_DUMMY_MOTOR_H

#include <string>

class DummyMotor
{
public:
    DummyMotor(const std::string &someString, int whatEverNumber);

private:
    std::string m_someString;
    int m_whatEverNumber;

};

#endif // GUIRLANDE_DUMMY_MOTOR_H
