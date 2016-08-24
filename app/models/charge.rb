class Charge < ActiveRecord::Base

  belongs_to :user
  
  def receipt
    Receipts::Receipt.new(
      id: id,
      product: "Definite6",
      company: {
        name: "Definite6, Inc.",
        address: "37 Great Jones\nFloor 2\nNew York City, NY 10012",
        email: "admin@definite6.com",
        logo: Rails.root.join("app/assets/images/creative/portfolio/football.jpg")
      },
      line_items: [
        ["Date",           created_at.strftime("%m/%d/%Y").to_s],
        ["Account Billed", "#{user.email}"],
        ["Product",        "Definite6"],
        ["Amount",         "$#{amount / 120}.00"],
        ["Charged to",     "#{card_brand} (**** **** **** #{card_last4})"],
      ],
    )
  end

end
