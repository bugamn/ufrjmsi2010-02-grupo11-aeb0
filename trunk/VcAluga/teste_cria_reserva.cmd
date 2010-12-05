--Globais
--Hora agora
!create agora:dataHora
!set agora.value := (23 * 60) + (11 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set agora.agora := agora

--Grupo de carro Categoria A
!create a :grupo_carro
!set a.categoria := 'A'

--modelo
!create t1 :modelo 
!set t1.marca := 'T1'
!insert (a, t1) into grupo_modelo

--carros
!create car1 :carro
!set car1.placa := 'AAA0000'
!set car1.ano := '1984'
!insert (t1, car1) into modelo_carro

!create car2 :carro
!set car2.placa := 'AAA0001'
!set car2.ano := '1984'
!insert (t1, car2) into modelo_carro

!create car3 :carro
!set car3.placa := 'AAA0002'
!set car3.ano := '1984'
!insert (t1, car3) into modelo_carro

!create car4 :carro
!set car4.placa := 'AAA0003'
!set car4.ano := '1984'
!insert (t1, car4) into modelo_carro

!create car5 :carro
!set car5.placa := 'AAA0004'
!set car5.ano := '1984'
!insert (t1, car5) into modelo_carro

!create car6 :carro
!set car6.placa := 'AAA0005'
!set car6.ano := '1984'
!insert (t1, car6) into modelo_carro

!create car7 :carro
!set car7.placa := 'AAA0006'
!set car7.ano := '1984'
!insert (t1, car7) into modelo_carro

--Agencia
!create jujuba :agencia
!set	jujuba.localizacao := 'Jujubalandia'
!insert (jujuba, car1) into possui

--Pais
!create br :pais
!set br.nome := 'Brasil'
!insert (jujuba, br) into localiza

--Regras
!create no1 :regra
!insert (br, no1) into impoe

--Cenário padrão
--data da emissao do CC
!create emissaoCC_p:dataHora
!set emissaoCC_p.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCC_p.agora := agora

--validade do CC
!create validCC_p:dataHora
!set validCC_p.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCC_p.agora := agora

--data da emissao da carteira
!create emissaoCarteira_p:dataHora
!set emissaoCarteira_p.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCarteira_p.agora := agora

--validade da carteira
!create validCarteira_p:dataHora
!set validCarteira_p.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCarteira_p.agora := agora

!create carteira_p:carteira_habilitacao
!set carteira_p.emissao := emissaoCarteira_p
!set carteira_p.validade := validCarteira_p

--o CC do Ze Sa
!create cartao_p:CC
!set cartao_p.possuidor := 'ze_sa'
!set cartao_p.disponibilidade := 10000.0
!set cartao_p.numero := '123456781234'
!set cartao_p.validade := validCC_p
!set cartao_p.emissao := emissaoCC_p

-- O Famoso Ze Sa!
!create ze_sa_p :cliente
!set ze_sa_p.nome := 'Ze Sa'
!set ze_sa_p.cpf := '11111111111'
!set ze_sa_p.endereco := 'Rua dos Bobos, n. 0'
!set ze_sa_p.idade := 42
!set ze_sa_p.cartao := cartao_p
!set ze_sa_p.condicao := 'normal'
!set ze_sa_p.apto := true
!insert (ze_sa_p, carteira_p) into tem

--opcao de grupo
!create op_p :opcao
!set op_p.grupo := a

-- O registro do Ze Sa
!create registro_p :registro
!insert (registro_p, ze_sa_p) into contem

--Reserva de Ze Sa
!create dReservaZe_p :dataHora
!set	dReservaZe_p.value := (20 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dReservaZe_p.agora := agora

!create dDevZe_p :dataHora
!set	dDevZe_p.value := (23 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dDevZe_p.agora := agora

!insert (ze_sa_p, br) into visita

--a acao propriamente dita
? ze_sa_p.registro->notEmpty()
? not(ze_sa_p.registro.listaNegra())
? not(op_p.grupo.isUndefined())
? jujuba.reserva->size() < jujuba.carro->size()
--a criacao da reserva
!create reservaZe_p : reserva between (ze_sa_p, jujuba)
!set	reservaZe_p.dataHora_reserva := dReservaZe_p
!set	reservaZe_p.dataHora_devolucao := dDevZe_p


--Cenário extendido por garantia de CC
--data da emissao do CC
!create emissaoCC_c:dataHora
!set emissaoCC_c.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCC_c.agora := agora

--validade do CC
!create validCC_c:dataHora
!set validCC_c.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCC_c.agora := agora

--data da emissao da carteira
!create emissaoCarteira_c:dataHora
!set emissaoCarteira_c.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCarteira_c.agora := agora

--validade da carteira
!create validCarteira_c:dataHora
!set validCarteira_c.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCarteira_c.agora := agora

!create carteira_c:carteira_habilitacao
!set carteira_c.emissao := emissaoCarteira_c
!set carteira_c.validade := validCarteira_c

--o CC do Ze Sa
!create cartao_c:CC
!set cartao_c.possuidor := 'ze_sa'
!set cartao_c.disponibilidade := 10000.00
!set cartao_c.numero := '123456781234'
!set cartao_c.validade := validCC_c
!set cartao_c.emissao := emissaoCC_c

-- O Famoso Ze Sa!
!create ze_sa_c : cliente
!set ze_sa_c.nome := 'Ze Sa'
!set ze_sa_c.cpf := '22222222222'
!set ze_sa_c.endereco := 'Rua dos Bobos, n. 0'
!set ze_sa_c.idade := 42
!set ze_sa_c.cartao := cartao_c
!set ze_sa_c.condicao := 'normal'
!set ze_sa_c.apto := true

--opcao de grupo
!create op_c :opcao
!set op_c.grupo := a

-- O registro do Ze Sa
!create registro_c :registro
!insert (registro_c, ze_sa_c) into contem

!insert (ze_sa_c, carteira_c) into tem

--Reserva de Ze Sa
!create dReservaZe_c : dataHora
!set	dReservaZe_c.value := (20 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dReservaZe_c.agora := agora

!create dDevZe_c : dataHora
!set	dDevZe_c.value := (23 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dDevZe_c.agora := agora

!insert (ze_sa_c, br) into visita

--a acao propriamente dita
? ze_sa_c.registro->notEmpty()
? not(ze_sa_c.registro.listaNegra())
? not(op_c.grupo.isUndefined())
!create reservaZe_c : reserva between (ze_sa_c, jujuba)
--!insert (ze_sa_c, jujuba) into reservaZe : reserva
!set	reservaZe_c.dataHora_reserva := dReservaZe_c
!set	reservaZe_c.dataHora_devolucao := dDevZe_c

-- garantia do cartao para a reserva
!insert (reservaZe_c, cartao_c) into garante
