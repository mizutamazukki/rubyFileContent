require  './util.rb'
module DBConnector
  class DBConnectors < Util

    def connectSecDB ( ip="localhost" , user="root" , pass = "" , db , item , itemNumber)
      counts = 0;
      my = Mysql2::Client.new(:host => "localhost",:username => "root" ,:password => "", :database => db)


      item.each_with_index {|item, idx|
        result = my.query("select MD5(
        '" + item[1] + "'
        '" + item[1] + "')", :cast => false)
        result.each(:as => :array) do |row|
          counts = counts + 1;
          text = "insert into suggest value ('" + counts.to_s + "' ,'" + row[0].to_s + "','" + item[1] + "','"+ item[1] +"');";
          File.open("./hoge.sql","a:UTF-8:US-ASCII") do |file|
            file.puts text
          end
          #File.close

        end
      }
    end
  end
end
