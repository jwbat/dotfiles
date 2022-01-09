#include <regex>
#include <string>

using std::string; using namespace std::string_literals;
using std::regex; using std::regex_constants::icase; using std::regex_match;

string s1{ "somestring" };
auto pattern {R"(^$)"s};
auto rx = regex{ pattern, icase };
bool is_a_match = regex_match(s1, rx);
