
    random_device rd{};
    mt19937 mt{ rd() };
    uniform_int_distribution<> ud{ 0, 9 };

    int random_int = ud(mt);
