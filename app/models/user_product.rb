class UserProduct < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :user_product_temps

  def affiliate_auto_connect_url
    unless self.product.external_url.nil?
      uri = self.product.external_url + "/affiliate_auto_connect" + "?"
      params = "external_id=#{self.external_id}&secret=#{self.secret}&api_key=#{ENV['API_KEY']}"
      uri + params
    end
  end

  def link(cpf_rate, fp_rate)
    unless self.product.external_url.nil?
      request_data = {email: self.user.email, cpf_rate: cpf_rate, fp_rate: fp_rate, title: self.user.pseudo,  phone_number: self.user.numero_de_telephone}.to_json
      uri = URI(self.product.external_url + '/main_link')
      res = Net::HTTP.post_form(uri, 'body' => request_data, "api_key" => ENV['API_KEY'])
      if res.code == '200'
        response_data = JSON.parse(res.body)["data"]
        self.update(secret: response_data["secret"], external_id: response_data["external_id"], linked: true, status:1)
      end
    end
  end

end
