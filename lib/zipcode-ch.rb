require "zipcode-fr"

module ZipCode
  class CH < ZipCode::FR
    VERSION = "1.0.0"

    def reader_options
      {
        col_sep: ';',
        encoding: 'UTF-8'
      }
    end
    private :reader_options

    def row_to_h(row)
      row[2] = row[1]
      row[1] = row[1].upcase
      [:zip, :name, :alt_name].zip(row).to_h
    end
    private :row_to_h

    def row_clean(row)
      row.map { |e| e.to_s.strip.encode('UTF-8') }
    end
    private :row_clean

    def data_source
      path = 'vendor/data/data.csv'
      File.expand_path(File.join(File.dirname(__FILE__), '..', path))
    end
    private :data_source
  end
end

ZipCode::DB.register(:ch, ZipCode::CH.new)
