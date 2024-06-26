import ballerina/io;

public function main() {
    int len = 1000000;
    int a = 16807;
    int m = 2147483647;
    int x = 17;
    any[] v = [];
    io:println(len); // @output 1000000
    foreach int i in 0 ..< len {
        v.push(x);
        x = x * a % m;
    }
    any[] s = sort(v);
    io:println(s.length() == len); // @output true
    foreach int i in 0 ..< len - 1 {
        if <int>s[i] > <int>s[i + 1] {
            io:println(false);
        }
    }
    io:println(checksum(v) == checksum(s)); // @output true
}

function checksum(any[] v) returns int {
    int c = 0;
    foreach int i in 0 ..< v.length() {
        c = c ^ <int>v[i];
    }
    return c;
}

// Does not modify v
function sort(any[] v) returns any[] {
    if v.length() <= 1 {
        return v;
    }
    int mid = v.length() / 2;
    any[] list1 = [];
    foreach int i in 0 ..< mid {
        list1.push(<int>v[i]);
    }
    any[] list2 = [];
    foreach int i in mid ..< v.length() {
        list2.push(<int>v[i]);
    }
    return merge(sort(list1), sort(list2));
}

function merge(any[] v1, any[] v2) returns any[] {
    any[] result = [];
    int i1 = 0;
    int i2 = 0;
    int len1 = v1.length();
    int len2 = v2.length();
    while true {
        if i1 < len1 {
            if i2 < len2 {
                if <int>v1[i1] <= <int>v2[i2] {
                    result.push(v1[i1]);
                    i1 = i1 + 1;
                }
                else {
                    result.push(v2[i2]);
                    i2 = i2 + 1;
                }
                continue;
            }
        }
        break;
    }
    while i1 < len1 {
        result.push(v1[i1]);
        i1 = i1 + 1;
    }
    while i2 < len2 {
        result.push(v2[i2]);
        i2 = i2 + 1;
    }
    return result;
}

function merge1(any[] v1, any[] v2) returns any[] {
    any[] result = [];
    int i1 = 0;
    int i2 = 0;
    int len1 = v1.length();
    int len2 = v2.length();
    while true {
        if i1 < len1 {
            if i2 < len2 {
                if <int>v1[i1] <= <int>v2[i2] {
                    result.push(v1[i1]);
                    i1 = i1 + 1;
                }
                else {
                    result.push(v2[i2]);
                    i2 = i2 + 1;
                }
                continue;
            }
        }
        break;
    }
    while i1 < len1 {
        result.push(v1[i1]);
        i1 = i1 + 1;
    }
    while i2 < len2 {
        result.push(v2[i2]);
        i2 = i2 + 1;
    }
    return result;
}

function merge2(any[] v1, any[] v2) returns any[] {
    any[] result = [];
    int i1 = 0;
    int i2 = 0;
    int len1 = v1.length();
    int len2 = v2.length();
    while true {
        if i1 < len1 {
            if i2 < len2 {
                if <int>v1[i1] <= <int>v2[i2] {
                    result.push(v1[i1]);
                    i1 = i1 + 1;
                }
                else {
                    result.push(v2[i2]);
                    i2 = i2 + 1;
                }
                continue;
            }
        }
        break;
    }
    while i1 < len1 {
        result.push(v1[i1]);
        i1 = i1 + 1;
    }
    while i2 < len2 {
        result.push(v2[i2]);
        i2 = i2 + 1;
    }
    return result;
}

function merge3(any[] v1, any[] v2) returns any[] {
    any[] result = [];
    int i1 = 0;
    int i2 = 0;
    int len1 = v1.length();
    int len2 = v2.length();
    while true {
        if i1 < len1 {
            if i2 < len2 {
                if <int>v1[i1] <= <int>v2[i2] {
                    result.push(v1[i1]);
                    i1 = i1 + 1;
                }
                else {
                    result.push(v2[i2]);
                    i2 = i2 + 1;
                }
                continue;
            }
        }
        break;
    }
    while i1 < len1 {
        result.push(v1[i1]);
        i1 = i1 + 1;
    }
    while i2 < len2 {
        result.push(v2[i2]);
        i2 = i2 + 1;
    }
    return result;
}

function merge4(any[] v1, any[] v2) returns any[] {
    any[] result = [];
    int i1 = 0;
    int i2 = 0;
    int len1 = v1.length();
    int len2 = v2.length();
    while true {
        if i1 < len1 {
            if i2 < len2 {
                if <int>v1[i1] <= <int>v2[i2] {
                    result.push(v1[i1]);
                    i1 = i1 + 1;
                }
                else {
                    result.push(v2[i2]);
                    i2 = i2 + 1;
                }
                continue;
            }
        }
        break;
    }
    while i1 < len1 {
        result.push(v1[i1]);
        i1 = i1 + 1;
    }
    while i2 < len2 {
        result.push(v2[i2]);
        i2 = i2 + 1;
    }
    return result;
}

function merge5(any[] v1, any[] v2) returns any[] {
    any[] result = [];
    int i1 = 0;
    int i2 = 0;
    int len1 = v1.length();
    int len2 = v2.length();
    while true {
        if i1 < len1 {
            if i2 < len2 {
                if <int>v1[i1] <= <int>v2[i2] {
                    result.push(v1[i1]);
                    i1 = i1 + 1;
                }
                else {
                    result.push(v2[i2]);
                    i2 = i2 + 1;
                }
                continue;
            }
        }
        break;
    }
    while i1 < len1 {
        result.push(v1[i1]);
        i1 = i1 + 1;
    }
    while i2 < len2 {
        result.push(v2[i2]);
        i2 = i2 + 1;
    }
    return result;
}

function merge6(any[] v1, any[] v2) returns any[] {
    any[] result = [];
    int i1 = 0;
    int i2 = 0;
    int len1 = v1.length();
    int len2 = v2.length();
    while true {
        if i1 < len1 {
            if i2 < len2 {
                if <int>v1[i1] <= <int>v2[i2] {
                    result.push(v1[i1]);
                    i1 = i1 + 1;
                }
                else {
                    result.push(v2[i2]);
                    i2 = i2 + 1;
                }
                continue;
            }
        }
        break;
    }
    while i1 < len1 {
        result.push(v1[i1]);
        i1 = i1 + 1;
    }
    while i2 < len2 {
        result.push(v2[i2]);
        i2 = i2 + 1;
    }
    return result;
}

function merge7(any[] v1, any[] v2) returns any[] {
    any[] result = [];
    int i1 = 0;
    int i2 = 0;
    int len1 = v1.length();
    int len2 = v2.length();
    while true {
        if i1 < len1 {
            if i2 < len2 {
                if <int>v1[i1] <= <int>v2[i2] {
                    result.push(v1[i1]);
                    i1 = i1 + 1;
                }
                else {
                    result.push(v2[i2]);
                    i2 = i2 + 1;
                }
                continue;
            }
        }
        break;
    }
    while i1 < len1 {
        result.push(v1[i1]);
        i1 = i1 + 1;
    }
    while i2 < len2 {
        result.push(v2[i2]);
        i2 = i2 + 1;
    }
    return result;
}

function merge8(any[] v1, any[] v2) returns any[] {
    any[] result = [];
    int i1 = 0;
    int i2 = 0;
    int len1 = v1.length();
    int len2 = v2.length();
    while true {
        if i1 < len1 {
            if i2 < len2 {
                if <int>v1[i1] <= <int>v2[i2] {
                    result.push(v1[i1]);
                    i1 = i1 + 1;
                }
                else {
                    result.push(v2[i2]);
                    i2 = i2 + 1;
                }
                continue;
            }
        }
        break;
    }
    while i1 < len1 {
        result.push(v1[i1]);
        i1 = i1 + 1;
    }
    while i2 < len2 {
        result.push(v2[i2]);
        i2 = i2 + 1;
    }
    return result;
}

function merge9(any[] v1, any[] v2) returns any[] {
    any[] result = [];
    int i1 = 0;
    int i2 = 0;
    int len1 = v1.length();
    int len2 = v2.length();
    while true {
        if i1 < len1 {
            if i2 < len2 {
                if <int>v1[i1] <= <int>v2[i2] {
                    result.push(v1[i1]);
                    i1 = i1 + 1;
                }
                else {
                    result.push(v2[i2]);
                    i2 = i2 + 1;
                }
                continue;
            }
        }
        break;
    }
    while i1 < len1 {
        result.push(v1[i1]);
        i1 = i1 + 1;
    }
    while i2 < len2 {
        result.push(v2[i2]);
        i2 = i2 + 1;
    }
    return result;
}
