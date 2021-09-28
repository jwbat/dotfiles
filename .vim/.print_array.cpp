void print_array(int* arr, size_t count) {

    for (size_t i{ 0 }; i < count; i++) {
        if (i % 10 == 0) cout << "\n";
        cout << setw(10) << arr[i];
    }
    cout << "\n\n";
}
