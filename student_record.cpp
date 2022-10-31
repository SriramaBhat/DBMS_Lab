/*****************************************************************************************************
    Consider a structure named Student with attributes as SID, NAME, 
    BRANCH, SEMESTER, ADDRESS. 
    Write a program in C/C++/ and perform the following operations using 
    the concept of files.
    a. Insert a new Student
    b. Modify the address of the Student based on SID
    c. Delete a Student
    d. List all the Students
    e. List all the Students of CSE branch.
    f. List all the Students of CSE branch and reside in Kuvempunagar.
*****************************************************************************************************/

#include <iostream>
#include <string>
#include <cstdlib>

void menu();
void insert();
void list_all();
void modify();
void delete_rec();
void search_sid();
void list_branch();
void list_address();
void list_address_branch();

using namespace std;

typedef struct Student {
        string SID;
        string name;
        string branch;
        string semester;
        string address;
} Student;

istream &operator>> (istream &is, Student &obj) {
    cout << "Enter the student SID: " << endl;
    fflush(stdin);
    getline(is, obj.SID);
    cout << "Enter the student name: " << endl;
    fflush(stdin);
    getline(is, obj.name);
    cout << "Enter the student branch: " << endl;
    fflush(stdin);
    getline(is, obj.branch);
    cout << "Enter the student semester: " << endl;
    fflush(stdin);
    getline(is, obj.semester);
    cout << "Enter the student address: " << endl;
    fflush(stdin);
    getline(is, obj.address);
    return is;
}

ostream &operator<< (ostream &os, const Student &obj) {
    os << obj.SID << "\t" << obj.name << "\t" << obj.branch << "\t" << obj.semester << "\t\t" << obj.address << endl;
    return os;    
}

void file_check(FILE *fp) {
    if(fp == nullptr) {
        cout << "Error opening the file" << endl;
        exit(2);
    } else {
        return;
    }
}

// Inserts the required number of records to the file in binary format
void insert() {
    Student stu;
    FILE *fp;
    system("cls"); // system("clear") on Linux based terminals

    fp = fopen("record.txt", "ab+");
    file_check(fp);

    fflush(stdin);
    cout << "\n--------------------Add New Record---------------------------\n" << endl;
    cin >> stu;
    fwrite(&stu, sizeof(stu), 1, fp);

    fclose(fp);
    cout << "Press any key to continue";
    fflush(stdin);
    cin.get();
    menu();
}

// Lists all the records in the file
void list_all() {
    FILE *fp;
    Student stu;
    system("cls"); // system("clear") for Linux based terminals
    cout << "\n------------------- Record List -----------------------\n" << endl;
    cout << "SID\t\tName\t\tBranch\tSemester\t\tAddress" << endl;

    fp = fopen("record.txt", "rb+");
    file_check(fp);

    while(fread(&stu, sizeof(stu), 1, fp) == 1) {
        cout << stu;
    }
    fclose(fp);
    cout << "Press any key to continue";
    fflush(stdin);
    cin.get();
    menu();
}

// Modifies the student data on basis of SID
void modify() {
    string stID;
    FILE *fp;
    Student stu;
    int flag = 0;
    system("cls"); // system("clear") for linux based terminals
    cout << "\n------------------------------ Modify Record ---------------------------------------\n" << endl;
    cout << "Enter the SID of the student to be modified: " << endl;
    cin >> stID;
    fp = fopen("record.txt", "rb+");
    file_check(fp);

    while(fread(&stu, sizeof(stu), 1, fp) == 1) {
        if(stID == stu.SID) {
            flag = 1;
            cin >> stu;   
            fseek(fp, -sizeof(stu), SEEK_CUR);
            fwrite(&stu, sizeof(stu), 1, fp);
            break;
        }
    }

    if(flag == 0) {
        cout << "Student not found, enter a valid SID: " << endl;
        fflush(stdin);
        cin.get();
        modify();
    }

    fclose(fp);
    cout << "Press any key to continue: " << endl;
    fflush(stdin);
    cin.get();
    menu();
}

// Deletes record on the basis of SID, if SID not present, the record remains unchanged
void delete_rec() {
    string stID;
    FILE *fp, *ft;
    Student stu;
    system("cls"); // system("clear") for Linux based terminals
    cout << "\n------------------------ Delete Record --------------------------\n" << endl;
    cout << "Enter the SID of the student to be deleted: " << endl;
    cin >> stID;
    fp = fopen("record.txt", "rb+");
    file_check(fp);
    ft = fopen("temp.txt", "wb+");
    file_check(ft);

    while(fread(&stu, sizeof(stu), 1, fp) == 1) {
        if(stID != stu.SID) {
            fwrite(&stu, sizeof(stu), 1, ft);
        }
    }
    fclose(fp);
    fclose(ft);
    remove("record.txt");
    rename("temp.txt", "record.txt");
    cout << "Press any key to continue:";
    fflush(stdin);
    cin.get();
    menu();
}

// Searchs a student record based on SID
// Not asked in the description
void search_sid() {
    string stID;
    FILE *fp;
    Student stu;
    system("cls"); // system("clear") for linux based terminals
    cout << "\n------------------------------ Search Record ---------------------------------------\n" << endl;
    cout << "Enter the SID of the student to be found: " << endl;
    cin >> stID;
    fp = fopen("record.txt", "rb+");
    file_check(fp);

    while(fread(&stu, sizeof(stu), 1, fp) == 1) {
        if(stID == stu.SID) {
            cout << "SID\t\tName\t\tBranch\tSemester\t\tAddress" << endl;
            cout << stu;
        }
    }

    fclose(fp);
    cout << "Press any key to continue:" << endl;
    fflush(stdin);
    cin.get();
    menu();
}

// Lists all the students in a given branch
void list_branch() {
    string stBr;
    FILE *fp;
    Student stu;
    system("cls"); // system("clear") for linux based terminals
    cout << "\n------------------------------ List Branch ---------------------------------------\n" << endl;
    cout << "Enter the Branch of the student to be found: " << endl;
    cin >> stBr;
    fp = fopen("record.txt", "rb+");
    file_check(fp);

    cout << "SID\t\tName\t\tBranch\tSemester\t\tAddress" << endl;
    while(fread(&stu, sizeof(stu), 1, fp) == 1) {
        if(stBr == stu.branch) {
            cout << stu;
        }
    }

    fclose(fp);
    cout << "Press any key to continue:";
    fflush(stdin);
    cin.get();
    menu();
}

// Lists all the students of a given address substring
// Not required as per description
void list_address() {
    string stAr;
    FILE *fp;
    Student stu;
    system("cls"); // system("clear") for linux based terminals
    cout << "\n------------------------------ List by Address ---------------------------------------\n" << endl;
    cout << "Enter the Address of the student to be found: " << endl;
    fflush(stdin);
    getline(cin, stAr);
    fp = fopen("record.txt", "rb+");
    file_check(fp);

    cout << "SID\t\tName\t\tBranch\tSemester\t\tAddress" << endl;
    while(fread(&stu, sizeof(stu), 1, fp) == 1) {
        if(stu.address.find(stAr) != string::npos) {
            cout << stu;
        }
    }

    fclose(fp);
    cout << "Press any key to continue:";
    fflush(stdin);
    cin.get();
    menu();
}

// Lists students of a given branch with given address substring
void list_address_branch() {
    string stBr, stAr;
    FILE *fp;
    Student stu;
    system("cls"); // system("clear") for linux based terminals
    cout << "\n------------------------------ List Branch and Address ---------------------------------------\n" << endl;
    cout << "Enter the Branch of the student to be found: " << endl;
    cin >> stBr;
    cout << "Enter the Address substring of the student to be found: " << endl;
    fflush(stdin);
    getline(cin, stAr);

    fp = fopen("record.txt", "rb+");
    file_check(fp);

    cout << "SID\t\tName\t\tBranch\tSemester\t\tAddress" << endl;
    while(fread(&stu, sizeof(stu), 1, fp) == 1) {
        if((stBr == stu.branch) && (stu.address.find(stAr) != string::npos)) {
            cout << stu;
        }
    }

    fclose(fp);
    cout << "Press any key to continue:";
    fflush(stdin);
    cin.get();
    menu();
}

// Prints out the menu and takes the user choice
void menu() {

    int choice;
    system("cls"); // system("clear") for Linux based terminals
    cout << "1) Add new student Record\n2) View all student records" << endl;
    cout << "3) Search Record using SID\n4) List students based on Branch" << endl;
    cout << "5) List students based on address\n6) List students based on address and branch" << endl;
    cout << "7) Modify a student record\n8) Delete a student record\n9) Exit" << endl;
    cout << "Enter your choice from the above operations:" << endl;
    fflush(stdin);
    cin >> choice;

    switch(choice) {
        case 1: insert(); break;

        case 2: list_all(); break;

        case 3: search_sid(); break;

        case 4: list_branch(); break;

        case 5: list_address(); break;

        case 6: list_address_branch(); break;

        case 7: modify(); break;

        case 8: delete_rec(); break;

        case 9: exit(1); break;
        
        default: cout << "Invalid Choice, enter new choice";
                menu(); break;
    }
}

int main() {

    menu();
    return 0;
}
