# Installation Guide

## Windows
Use <http://railsinstaller.org/en>.
Make sure to install Git (if you don't have already), Ruby, Rails, and Bundler
Then, skip to step 5


## Linux and Mac
### 1. Install Git
For linux (debian based): `sudo apt-get git-all`
For mac/windows, visit <https://desktop.github.com/>

### 2. Install Ruby
If you get stuck at any time, refer to <https://www.ruby-lang.org/en/documentation/installation/>
#### Linux
For apt (Debian, Ubuntu, etc):
```
sudo apt-get install ruby-full
```

For pacman (Arch Linux):
```
sudo pacman -S ruby
```

#### Mac
Install homebrew first! Seriously, it's great
```
brew install ruby
```


## 3. Install Bundler
Bundler will let us keep track of and install all of the other gems that are needed (such as rails). These are located in the file named "Gemfile"
```
gem install bundler
```

If you get an error saying that "You dont have /home/USERNAME/.gen/ruby/... in your PATH, gem executables will not run" then run the following command, replacing USERNAME with your actual username (if you are on a different version of ruby, change that too)
```
export PATH="/home/USERNAME/.gem/ruby/2.3.0/bin:$PATH"
```

## 4. Clone github repo
Now it's time to get all of the website's code from github! Make sure you are in the parent directory of where you want to have your project (For example, /home/ or workspace/) The second command will just take us to the folder we just downloaded.
```
git clone https://github.com/Muhlenberg/muhlenberg.github.io.git
cd muhlenberg.github.io
```

## 5. Install Gems
Finally, install all of the gems that we need
```
bundle install
```





