template <typename T>
void print_vector(vector<T>& vec) 
{
    for (size_t i{ 0 }; i < vec.size(); ++i) 
    {
        if (i % 10 == 0) cout << "\n";
        cout << setw(6) << vec[i];
    }
    cout << "\n";
}
