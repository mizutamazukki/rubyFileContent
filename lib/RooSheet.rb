require  './util.rb'
require  './dbConnector.rb'

module Sheet
  class SheetClass < Util
    # sheet 一覧をすべて取得
    def SheetItem (filePath)
      items = Array.new()
      xlsx = Roo::Spreadsheet.open('../test.xlsx', extension: :xlsx)
      xlsx.each_with_index{|item, idx|
         items[idx] = item
      }
      return items
    end
  end
end

SheetInstance = Sheet::SheetClass.new
DBRead = DBConnector::DBConnectors.new
ItemList = SheetInstance.SheetItem("")
DBRead.connectSecDB("suggest" , ItemList, ItemList.length)
