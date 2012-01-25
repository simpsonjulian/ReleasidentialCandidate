require 'rake/clean'
CLEAN.include('product/manifest')
CLEAN.include('product/*.zip')
task :clobber do 
  sh " cd product && mvn clean "
end
task :default => :clean do 
  sh "giternal update"
  sh "cd product && ./build_rc.sh"
end
