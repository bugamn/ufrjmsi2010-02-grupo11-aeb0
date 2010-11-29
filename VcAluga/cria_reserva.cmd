--Hora agora
!create agora:dataHora
!set agora.value := (23 * 60) + (11 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set agora.agora := agora

--data da emissao do CC
!create emissaoCC:dataHora
!set emissaoCC.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCC.agora := agora

--validade do CC
!create validCC:dataHora
!set validCC.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCC.agora := agora

--data da emissao da carteira
!create emissaoCarteira:dataHora
!set emissaoCarteira.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCarteira.agora := agora

--validade da carteira
!create validCarteira:dataHora
!set validCarteira.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCarteira.agora := agora

!create carteira:carteira_habilitacao
!set carteira.emissao := emissaoCarteira
!set carteira.validade := validCarteira

--o CC do Ze Sa
!create cartao:CC
!set cartao.possuidor := 'ze_sa'
!set cartao.disponibilidade := 10000.00
!set cartao.numero := 1234 5678 1234
!set cartao.validade := validCC
!set cartao.emissao := emissaoCC

-- O Famoso Ze Sa!
!create ze_sa : cliente
!set ze_sa.nome := 'Ze Sa'
!set ze_sa.cpf := '11111111111'
!set ze_sa.endereco := 'Rua dos Bobos, n. 0'
!set ze_sa.idade := 42
!set ze_sa.cartao := cartao
!set ze_sa.condicao := 'normal'
!set ze_sa.apto := true

!insert (ze_sa, carteira) into tem

--Reserva de Ze Sa
!create dReservaZe : dataHora
!set	dReservaZe.value := (20 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dReservaZe.agora := agora

!create dDevZe : dataHora
!set	dDevZe.value := (23 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dDevZe.agora := agora

--Agencia
!create jujuba : agencia
!set	jujuba.localizacao := 'Jujubalandia'

!create reservaZe : reserva between (ze_sa, jujuba)
--!insert (ze_sa, jujuba) into reservaZe : reserva
!set	reservaZe.dataHora_reserva := dReservaZe
!set	reservaZe.dataHora_devolucao := dDevZe

--Grupo de carro Categoria A

!create a : grupo_carro
!set	a.categoria := 'Conversivel'

-- garantia do cartao para a reserva
!insert (reservaZe, cartao) into garante
