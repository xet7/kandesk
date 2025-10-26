defmodule Kandesk.Mailer do
  use Pow.Phoenix.Mailer
  # use Bamboo.Mailer, otp_app: :kandesk

  # import Bamboo.Email

  def cast(%{user: user, subject: subject, text: text, html: html}) do
    # new_email(
    #   to: user.email,
    #   from: "kandesk@xehex.com",
    #   subject: subject,
    #   html_body: html,
    #   text_body: text
    # )
    # Temporary placeholder until bamboo is re-enabled
    %{to: user.email, from: "kandesk@xehex.com", subject: subject, html: html, text: text}
  end

  def process(email) do
    # deliver_later(email)
    # Temporary placeholder until bamboo is re-enabled
    IO.puts("Email would be sent: #{inspect(email)}")
  end
end