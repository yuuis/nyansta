class ApplicationController < ActionController::Base
  def toJP(prefecture)
    case prefecture
      when "hokkaido" then
        return "北海道"
      when "tokyo" then
        return "東京"
      when "saitama" then
        return "埼玉県"
      when "kyoto" then
        return "京都府"
      when "hukuoka" then
        return "福岡県"
    end
  end
end
