class ClientMailer < ApplicationMailer

	def odb_mailer(client,datetime)
		@client = client
		@datetime = datetime
		mail(to: @client.email, subject: 'Recordatorio de cita Blushbar')
	end
end
