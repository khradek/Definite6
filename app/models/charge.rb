class Charge < ActiveRecord::Base

  belongs_to :user
  
  def receipt
    Receipts::Receipt.new(
      id: id,
      product: "Definite6",
      company: {
        name: "Definite6.com",
        address: "PO Box 58002\nWaxhaw, NC 28173",
        email: "admin@definite6.com",
        logo: Rails.root.join("app/assets/images/creative/portfolio/Logo.png")
      },
      line_items: [
        ["Date",           created_at.strftime("%m/%d/%Y").to_s],
        ["Account Billed", "#{user.first_name} #{user.last_name} (#{user.email})"],
        ["Product",        "Definite6.com Annual Subscription"],
        ["Amount",         "$#{amount / 100}.00"],
        ["Charged to",     "#{card_brand} (**** **** **** #{card_last4})"],
      ],
    )
  end

end
