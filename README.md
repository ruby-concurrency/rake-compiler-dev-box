# Concurrent Ruby Build Box

A set of [Vagrant](http://www.vagrantup.com/) configurations for creating build
machines that can build various platform-specific gem packages for
[concurrent-ruby](https://github.com/ruby-concurrency/concurrent-ruby).

This project originally began as a fork of the excellent
[rake-compiler-dev-box](https://github.com/luislavena/rake-compiler) project. It
has undergone significant changes since the original forking. Please rfer to the
[original README](https://github.com/ruby-concurrency/rake-compiler-dev-box/blob/master/README.md) for more information.

## Dependencies

* [Vagrant](http://www.vagrantup.com/) 1.6 or newer
* [VirtualBox](https://www.virtualbox.org/) 4.3.12 or newer

## Building Gems

The `Vagrantfile` in this project specifies three build box configurations. The
two Ubuntu boxes are capable of running all the build tasks. The Solaris box
does not support [RVM](http://rvm.io/) so it can only be used to build the
Solaris-specific gem. For consistency, the bulk of the building should be done
on the 64-bit Ubuntu box.

For this to work the `concurrent-ruby` git repository must be cloned into a
directory *beneath* the `rake-compiler-dev-box` directory:

    $ pwd
    /Users/Jerry/Projects/FOSS
    $ git clone https://github.com/ruby-concurrency/rake-compiler-dev-box.git
    Cloning into 'rake-compiler-dev-box'...
    $ cd rake-compiler-dev-box
    $ git clone https://github.com/ruby-concurrency/concurrent-ruby.git
    Cloning into 'concurrent-ruby'...
    $ pwd
    /Users/Jerry/Projects/FOSS/ruby-concurrency/rake-compiler-dev-box

Once both repositories have been cloned, launch each box one at a time and
conduct the builds. The Vagrant names for the boxes are:

* `ubuntu64`
* `ubuntu32`
* `solaris`

Building the gem is done by logging into each virtual maching, changing to the
correct directory, and running the appropriate script. Starting with the main
Ubuntu 64-bit build box:

    $ cd ~/Projects/FOSS/ruby-concurrency/rake-compiler-dev-box
    $ vagrant up ubuntu64

The box may take a few minutes to boot. Next, secure shell into the box:

    $ vagrant ssh ubuntu64

Once connected to the build box via SSH, change to the appropriate directory and
run the build script:

    $$ cd /vagrant
    $$ package_all concurrent-ruby

Once the build process is complete, `exit` the SSH session and shutdown the
build box:

    $ vagrant halt ubuntu

The process for the other two boxes is similar, except that a different build
script should be run for each:

* ubuntu64: `package_all`
* ubuntu32: `package_native`
* solaris: `package_native`

Once the build script has run to completion, all of the created gem files will
be saved to the `pkg` directory of the `concurrent-ruby` repository that was
cloned beneath `rake-compiler-dev-box`.

The full list of builds that should have been created will be:

* concurrent-ruby-<version>-java.gem
* concurrent-ruby-<version>-x64-mingw32.gem
* concurrent-ruby-<version>-x86_64-linux.gem
* concurrent-ruby-<version>-x86-linux.gem
* concurrent-ruby-<version>-x86-mingw32.gem
* concurrent-ruby-<version>-x86-solaris-2.11.gem
* concurrent-ruby-<version>.gem

## License and Copyright

*Concurrent Ruby* is free software released under the [MIT License](http://www.opensource.org/licenses/MIT).
