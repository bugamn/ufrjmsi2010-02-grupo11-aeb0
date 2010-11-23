--Reserva de Ze Sa
!create dReservaZe : dataHora
!set	dReservaZe.value :=
!set	dReservaZe.agora :=

!create dDevZe : dataHora
!set	dDevZe.value :=
!set	dDevZe.agora :=

!create reservaZe : reserva
!set	reservaZe.dataHora_reserva := dReservaZe
!set	reservaZe.dataHora_devolucao := dDevZe

--Grupo de carro Categoria A

!create a : grupo_carro
!set	a.categoria := 'Conversivel'

--Agencia

!create jujuba : agencia
!set	jujuba.localizacao := 'Jujubalandia'

