#include <chrono>

using namespace std::chrono;

auto start = high_resolution_clock::now();
auto stop = high_resolution_clock::now();
auto t = duration_cast<microseconds>(stop - start);
auto microseconds = t.count();
