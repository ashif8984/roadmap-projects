## GitHub Pages Deployment
A simple GitHub Actions workflow to deploy a static website to GitHub Pages.

Sample solution for [GitHub Pages Deployment](https://roadmap.sh/projects/github-actions-deployment-workflow)\
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.



### Steps to run the script in Linux server


**Clone the repository**

```sh
git clone https://github.com/ashif8984/roadmap-projects.git
cd gh-deployment-workflow
```


✅ **Steps you need to perform [Github Actions Workflow]**
1. On the project/repository root add the folder with name: .github/workflows
2. Inside the .github/workflows add a file name with yml extenstion Ex: deploy.yml
3. This file is the workflow file , github action uses to run all the action defined within it.
4. This file can be thought of Jenkinsfile, that performs the traditional CICD steps
5. Add the required steps. Ref [Sample Github Action Workflow](https://docs.github.com/en/actions/writing-workflows/quickstart#creating-your-first-workflow)
6. Only changes you need to do is, if your index.html is at the root or within a specific folder add as below-

```
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          # Upload entire repository
          path: './FOLDER_NAME' # if the index.html is inside a folder
          #path: './'            # if the index.html is at the root

```


✅ **Steps you need to perform [Code Changes]**
1. Open the cloned repository in any code editor
2. Navigate to the folder named - gh-deployment-workflow and open the index.html
3. Make any changes to the index.html file to simulate a code change.
4. You can just add a line or update existing text within any HTML tag.
5. Commit your changes and push it to Github repository

```
git add .
git commit -m "Making code changes"
git push origin main
```

✅ **Steps Github Actions performs [under the hood]**

1. As soon as you pushed to main branch, a github action workflow starts to run.
2. Click on the action button on the top with play icon.
3. You can view list of workflow that run, open the latest run.
4. You can view the complete log of the steps performed.
5. At the last, you will see the 'Complete job' step where you can fetch the deployed URL.
6. Open the URL in new tab, you will the changes that you pushed automatically gets deployed to your website(here the static page)




✅ Result : 👉 [My Website Link](https://ashif8984.github.io/roadmap-projects/)