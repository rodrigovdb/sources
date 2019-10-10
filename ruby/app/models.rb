Dir.glob(Pathname(__FILE__).sub_ext('/*.rb'), &method(:require))
