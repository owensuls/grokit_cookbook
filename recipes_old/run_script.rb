script "Run a script" do
  interpreter "bash"
  code <<-EOH
    mkdir -m 777 /tmp/run-script-demo
    touch /tmp/run-script-demo/helloworld.txt
    echo "Hello, owen1633!" > /tmp/run-script-demo/helloworld.txt
  EOH
end
