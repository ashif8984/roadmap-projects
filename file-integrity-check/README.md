## File Integrity Checker
You are required to develop a tool that verifies the integrity of log files to detect tampering. This tool can be used to enhance security measures by using techniques such as file integrity monitoring and hashing to ensure that no unauthorized changes have been made to the log files.
https://roadmap.sh/projects/file-integrity-checker


Sample solution for [File Integrity Checker](https://roadmap.sh/projects/file-integrity-checker)\
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.



### Steps to create cryptographic hash

✅ **Steps you need to perform**

1. Create a folder and add file with different content in each files. Ex-
  
  ```sh
   testfolder/file1.txt
   testfolder/file2.txt
   testfolder/file3.txt
  ```

2. Execute the script (file-integrity.sh) to create or check Hashing-
   
  ```sh
    # to create hash for each file inside the folder
   ./file-integrity.sh init <FOLDER_NAME> 

   # to check the hash for the given file
   ./file-integrity.sh check <FILE_NAME>  
  ```



```sh
git clone https://github.com/ashif8984/roadmap-projects.git
cd file-integrity-check
chmod +x file-integrity.sh
```


```sh

# Initializes and stores hashes of all log files in the directory
./file-integrity.sh init demo 

# Check if the hash matches 
./file-integrity.sh check demo/file3 
status: ✅ Unmodified

./file-integrity.sh check demo/file2 
Status: ❌ Modified (Hash mismatch)
Reporting the file since Hash mismatched...

```


✅ Result : 👉 [My Website Link](https://ashif8984.github.io/roadmap-projects/)