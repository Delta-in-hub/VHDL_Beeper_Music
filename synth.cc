#include <bits/stdc++.h>

using namespace std;
#define debug(x) std::cout << #x << " is " << (x) << '\n'
using ll  = long long;
using ull = unsigned long long;

signed main(void)
{
    ifstream in("input3.txt");
    ofstream file("synth3.txt");
    file << "CASE conv_integer(state) IS\n";
    int state = 0;
    string s;
    regex re("[LHMlhm]\\d ?\\d*");
    if(not in.is_open())
        return 0;
    while (getline(in, s))
    {
        if (not regex_match(s, re))
        {
            cout << "Reject" << endl;
            continue;
        }
        for_each(begin(s), end(s), [](char& c) { c = toupper(c); });
        int num = atoi(s.c_str() + 3);
        if (num == 0)
            num = 1;
        //WHEN 0 => count_end <= conv_std_logic_vector(L3,17);
        switch (s[0])
        {
        case 'L':
        case 'M':
        case 'H':
            while (num--)
                file << "    WHEN " << state++ << " => count_end <= conv_std_logic_vector(" << s.substr(0, 2) << ",17);" << endl;
            break;
        default:
            cout << "Reject" << endl;
            break;
        }
    }
    file << "    WHEN OTHERS => count_end <= count_end;" << endl;
    file << "END CASE;";
    file.close();
    return 0;
}