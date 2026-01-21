
### কোড এডিট করতে হলে main ব্রাঞ্চে যাওয়া লাগবে
* git checkout main 
* git add .
  git commit -m "Update footer and hero section"
* flutter build web
* git checkout gh-pages
* cp -r build/web/* .
* git add .
  git commit -m "Update website with latest changes"
* git push origin gh-pages --force



link link url: [https://masumraj1.github.io/portfolio/]
