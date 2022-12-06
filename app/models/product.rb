class Product < ApplicationRecord
  has_many :user_products

  def self.statuses
    {0 => "Victime de son succès", 1 => "Disponible", 2 => "Bientôt disponible"}
  end

  def self.get_and_populate_data
    Product.where.not(external_url: nil).each do |product|


      linked_user_products = product.user_products.where(linked: true)
      external_ids = linked_user_products.map{|user_product| user_product.external_id }.to_json

      uri = URI(product.external_url + '/get_and_populate_data')
      res = Net::HTTP.post_form(uri, 'body' => external_ids, "api_key" => ENV['API_KEY'])

      if res.code == '200'
        response_data = JSON.parse(res.body)["data"]
        response_data.each do |key, value|
          user_product = product.user_products.where(external_id: key).first
          user_product.update(
            visits: value[0],
            inscriptions: value[1],
            ventes: value[2],
            commissions: value[3],
            commissions_pending: value[4],
            commissions_validated: value[5],
            bonus: value[6],
            master_affiliate_commission: value[7]
          )
        end
      end

    end
  end

end
