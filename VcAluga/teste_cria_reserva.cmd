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

--data Revisao
!create revisao :dataHora
!set revisao.value := (1 * 60) + (1 * 30 * 24 * 60) + (1984 * 365 * 24 * 60)
!set revisao.agora := agora

--carros
!create car1 :carro
!set car1.placa := 'AAA0000'
!set car1.ano := '1984'
!set car1.quilometragem := 0
!set car1.preparado := true
!set car1.verificado := true
!set car1.condicao := 'normal'
!set car1.quilometragemRevisado := 0
!set car1.dataRevisado := revisao
!insert (t1, car1) into modelo_carro

!create car2 :carro
!set car2.placa := 'AAA0001'
!set car2.ano := '1984'
!set car2.quilometragem := 0
!set car2.preparado := true
!set car2.verificado := true
!set car2.condicao := 'normal'
!set car2.quilometragemRevisado := 0
!set car2.dataRevisado := revisao
!insert (t1, car2) into modelo_carro

!create car3 :carro
!set car3.placa := 'AAA0002'
!set car3.ano := '1984'
!set car3.quilometragem := 0
!set car3.preparado := true
!set car3.verificado := true
!set car3.condicao := 'normal'
!set car3.quilometragemRevisado := 0
!set car3.dataRevisado := revisao
!insert (t1, car3) into modelo_carro

!create car4 :carro
!set car4.placa := 'AAA0003'
!set car4.ano := '1984'
!set car4.quilometragem := 0
!set car4.preparado := true
!set car4.verificado := true
!set car4.condicao := 'normal'
!set car4.quilometragemRevisado := 0
!set car4.dataRevisado := revisao
!insert (t1, car4) into modelo_carro

!create car5 :carro
!set car5.placa := 'AAA0003'
!set car5.ano := '1984'
!set car5.quilometragem := 0
!set car5.preparado := true
!set car5.verificado := true
!set car5.condicao := 'normal'
!set car5.quilometragemRevisado := 0
!set car5.dataRevisado := revisao
!insert (t1, car5) into modelo_carro

--Agencia
!create jujuba :agencia
!set	jujuba.localizacao := 'Jujubalandia'
!insert (jujuba, car1) into possui
!insert (jujuba, car2) into possui
!insert (jujuba, car3) into possui
!insert (jujuba, car4) into possui
!insert (jujuba, car5) into possui

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
? ze_sa_p.reserva->select(r : reserva | (r.dataHora_reserva.toDay() > dReservaZe_p.toDay() and r.dataHora_reserva.toDay() < dDevZe_p.toDay()) or (r.dataHora_devolucao.toDay() > dReservaZe_p.toDay() and r.dataHora_devolucao.toDay() < dDevZe_p.toDay()) and (dReservaZe_p.toDay() > r.dataHora_reserva.toDay() and dReservaZe_p.toDay() < r.dataHora_devolucao.toDay()) or (dDevZe_p.toDay() > r.dataHora_reserva.toDay() and dDevZe_p.toDay() < r.dataHora_devolucao.toDay()))->isEmpty()
--a criacao da reserva
!create reservaZe_p : reserva between (ze_sa_p, jujuba)
!set	reservaZe_p.dataHora_reserva := dReservaZe_p
!set	reservaZe_p.dataHora_devolucao := dDevZe_p
--garantido?
? reservaZe_p.cartao->isEmpty()


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
? jujuba.reserva->size() < jujuba.carro->size()
? ze_sa_c.reserva->select(r : reserva | (r.dataHora_reserva.toDay() > dReservaZe_p.toDay() and r.dataHora_reserva.toDay() < dDevZe_p.toDay()) or (r.dataHora_devolucao.toDay() > dReservaZe_p.toDay() and r.dataHora_devolucao.toDay() < dDevZe_p.toDay()) and (dReservaZe_p.toDay() > r.dataHora_reserva.toDay() and dReservaZe_p.toDay() < r.dataHora_devolucao.toDay()) or (dDevZe_p.toDay() > r.dataHora_reserva.toDay() and dDevZe_p.toDay() < r.dataHora_devolucao.toDay()))->isEmpty()
!create reservaZe_c : reserva between (ze_sa_c, jujuba)
!set	reservaZe_c.dataHora_reserva := dReservaZe_c
!set	reservaZe_c.dataHora_devolucao := dDevZe_c

-- garantia do cartao para a reserva
!insert (reservaZe_c, cartao_c) into garante
--garantido?
? reservaZe_c.cartao->notEmpty()


--Para o caso de ser da lista negra

--data da emissao do CC
!create emissaoCC_ln:dataHora
!set emissaoCC_ln.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCC_ln.agora := agora

--validade do CC
!create validCC_ln:dataHora
!set validCC_ln.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCC_ln.agora := agora

--data da emissao da carteira
!create emissaoCarteira_ln:dataHora
!set emissaoCarteira_ln.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCarteira_ln.agora := agora

--validade da carteira
!create validCarteira_ln:dataHora
!set validCarteira_ln.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCarteira_ln.agora := agora

!create carteira_ln:carteira_habilitacao
!set carteira_ln.emissao := emissaoCarteira_ln
!set carteira_ln.validade := validCarteira_ln

--o CC do Ze Sa
!create cartao_ln:CC
!set cartao_ln.possuidor := 'ze_sa'
!set cartao_ln.disponibilidade := 10000.00
!set cartao_ln.numero := '123456781234'
!set cartao_ln.validade := validCC_ln
!set cartao_ln.emissao := emissaoCC_ln

-- O Famoso Ze Sa!
!create ze_sa_ln : cliente
!set ze_sa_ln.nome := 'Ze Sa'
!set ze_sa_ln.cpf := '22222222222'
!set ze_sa_ln.endereco := 'Rua dos Bobos, n. 0'
!set ze_sa_ln.idade := 42
!set ze_sa_ln.cartao := cartao_ln
!set ze_sa_ln.condicao := 'normal'
!set ze_sa_ln.apto := true
--opcao de grupo
!create op_ln :opcao
!set op_ln.grupo := a

-- O registro do Ze Sa
!create registro_ln :registro
!set registro_ln.problemas_pagamento := 'caloteiro'
!insert (registro_ln, ze_sa_ln) into contem

!insert (ze_sa_ln, carteira_ln) into tem

--Reserva de Ze Sa
!create dReservaZe_ln : dataHora
!set	dReservaZe_ln.value := (20 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dReservaZe_ln.agora := agora

!create dDevZe_ln : dataHora
!set	dDevZe_ln.value := (23 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dDevZe_ln.agora := agora

!insert (ze_sa_ln, br) into visita

--a acao propriamente dita
? ze_sa_ln.registro->notEmpty()
? ze_sa_ln.registro.listaNegra()


--Cenário com grupo indefinido
--data da emissao do CC
!create emissaoCC_gi:dataHora
!set emissaoCC_gi.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCC_gi.agora := agora

--validade do CC
!create validCC_gi:dataHora
!set validCC_gi.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCC_gi.agora := agora

--data da emissao da carteira
!create emissaoCarteira_gi:dataHora
!set emissaoCarteira_gi.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCarteira_gi.agora := agora

--validade da carteira
!create validCarteira_gi:dataHora
!set validCarteira_gi.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCarteira_gi.agora := agora

!create carteira_gi:carteira_habilitacao
!set carteira_gi.emissao := emissaoCarteira_gi
!set carteira_gi.validade := validCarteira_gi

--o CC do Ze Sa
!create cartao_gi:CC
!set cartao_gi.possuidor := 'ze_sa'
!set cartao_gi.disponibilidade := 10000.0
!set cartao_gi.numero := '123456781234'
!set cartao_gi.validade := validCC_gi
!set cartao_gi.emissao := emissaoCC_gi

-- O Famoso Ze Sa!
!create ze_sa_gi :cliente
!set ze_sa_gi.nome := 'Ze Sa'
!set ze_sa_gi.cpf := '11111111111'
!set ze_sa_gi.endereco := 'Rua dos Bobos, n. 0'
!set ze_sa_gi.idade := 42
!set ze_sa_gi.cartao := cartao_gi
!set ze_sa_gi.condicao := 'normal'
!set ze_sa_gi.apto := true
!insert (ze_sa_gi, carteira_gi) into tem

--opcao de grupo
!create op_gi :opcao

-- O registro do Ze Sa
!create registro_gi :registro
!insert (registro_gi, ze_sa_gi) into contem

--Reserva de Ze Sa
!create dReservaZe_gi :dataHora
!set	dReservaZe_gi.value := (20 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dReservaZe_gi.agora := agora

!create dDevZe_gi :dataHora
!set	dDevZe_gi.value := (23 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dDevZe_gi.agora := agora

!insert (ze_sa_gi, br) into visita

--a acao propriamente dita
? ze_sa_gi.registro->notEmpty()
? not(ze_sa_gi.registro.listaNegra())
? op_gi.grupo.isUndefined()
!set op_gi.grupo := a
? jujuba.reserva->size() < jujuba.carro->size()
? ze_sa_gi.reserva->select(r : reserva | (r.dataHora_reserva.toDay() > dReservaZe_gi.toDay() and r.dataHora_reserva.toDay() < dDevZe_gi.toDay()) or (r.dataHora_devolucao.toDay() > dReservaZe_gi.toDay() and r.dataHora_devolucao.toDay() < dDevZe_gi.toDay()) and (dReservaZe_gi.toDay() > r.dataHora_reserva.toDay() and dReservaZe_gi.toDay() < r.dataHora_devolucao.toDay()) or (dDevZe_gi.toDay() > r.dataHora_reserva.toDay() and dDevZe_gi.toDay() < r.dataHora_devolucao.toDay()))->isEmpty()
--a criacao da reserva
!create reservaZe_gi : reserva between (ze_sa_gi, jujuba)
!set	reservaZe_gi.dataHora_reserva := dReservaZe_gi
!set	reservaZe_gi.dataHora_devolucao := dDevZe_gi
--garantido?
? reservaZe_gi.cartao->isEmpty()


--Cenário com sobreposição de períodos
--data da emissao do CC
!create emissaoCC_sp:dataHora
!set emissaoCC_sp.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCC_sp.agora := agora

--validade do CC
!create validCC_sp:dataHora
!set validCC_sp.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCC_sp.agora := agora

--data da emissao da carteira
!create emissaoCarteira_sp:dataHora
!set emissaoCarteira_sp.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCarteira_sp.agora := agora

--validade da carteira
!create validCarteira_sp:dataHora
!set validCarteira_sp.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCarteira_sp.agora := agora

!create carteira_sp:carteira_habilitacao
!set carteira_sp.emissao := emissaoCarteira_sp
!set carteira_sp.validade := validCarteira_sp

--o CC do Ze Sa
!create cartao_sp:CC
!set cartao_sp.possuidor := 'ze_sa'
!set cartao_sp.disponibilidade := 10000.0
!set cartao_sp.numero := '123456781234'
!set cartao_sp.validade := validCC_sp
!set cartao_sp.emissao := emissaoCC_sp

-- O Famoso Ze Sa!
!create ze_sa_sp :cliente
!set ze_sa_sp.nome := 'Ze Sa'
!set ze_sa_sp.cpf := '11111111111'
!set ze_sa_sp.endereco := 'Rua dos Bobos, n. 0'
!set ze_sa_sp.idade := 42
!set ze_sa_sp.cartao := cartao_sp
!set ze_sa_sp.condicao := 'normal'
!set ze_sa_sp.apto := true
!insert (ze_sa_sp, carteira_sp) into tem

--opcao de grupo
!create op_sp :opcao
!set op_sp.grupo := a

-- O registro do Ze Sa
!create registro_sp :registro
!insert (registro_sp, ze_sa_sp) into contem

--Reserva de Ze Sa
!create dReservaZe_sp :dataHora
!set	dReservaZe_sp.value := (20 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dReservaZe_sp.agora := agora

!create dDevZe_sp :dataHora
!set	dDevZe_sp.value := (23 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dDevZe_sp.agora := agora

!create reservaZe_sp : reserva between (ze_sa_sp, jujuba)
!set	reservaZe_sp.dataHora_reserva := dReservaZe_sp
!set	reservaZe_sp.dataHora_devolucao := dDevZe_sp
!insert (ze_sa_sp, br) into visita

--a acao propriamente dita
? ze_sa_sp.registro->notEmpty()
? not(ze_sa_sp.registro.listaNegra())
? not(op_sp.grupo.isUndefined())
? jujuba.reserva->size() < jujuba.carro->size()
? ze_sa_gi.reserva->select(r : reserva | (r.dataHora_reserva.toDay() >= dReservaZe_gi.toDay() and r.dataHora_reserva.toDay() <= dDevZe_gi.toDay()) or (r.dataHora_devolucao.toDay() >= dReservaZe_gi.toDay() and r.dataHora_devolucao.toDay() <= dDevZe_gi.toDay()) and (dReservaZe_gi.toDay() >= r.dataHora_reserva.toDay() and dReservaZe_gi.toDay() <= r.dataHora_devolucao.toDay()) or (dDevZe_gi.toDay() >= r.dataHora_reserva.toDay() and dDevZe_gi.toDay() <= r.dataHora_devolucao.toDay()))->notEmpty()



--Para o caso de ser novo cliente

--data da emissao do CC
!create emissaoCC_nc:dataHora
!set emissaoCC_nc.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCC_nc.agora := agora

--validade do CC
!create validCC_nc:dataHora
!set validCC_nc.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCC_nc.agora := agora

--data da emissao da carteira
!create emissaoCarteira_nc:dataHora
!set emissaoCarteira_nc.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCarteira_nc.agora := agora

--validade da carteira
!create validCarteira_nc:dataHora
!set validCarteira_nc.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCarteira_nc.agora := agora

!create carteira_nc:carteira_habilitacao
!set carteira_nc.emissao := emissaoCarteira_nc
!set carteira_nc.validade := validCarteira_nc

--o CC do Ze Sa
!create cartao_nc:CC
!set cartao_nc.possuidor := 'ze_sa'
!set cartao_nc.disponibilidade := 10000.00
!set cartao_nc.numero := '123456781234'
!set cartao_nc.validade := validCC_nc
!set cartao_nc.emissao := emissaoCC_nc

!create ze_sa_nc : cliente
!set ze_sa_nc.nome := 'Ze Sa'
!set ze_sa_nc.cpf := '22222222222'
!set ze_sa_nc.endereco := 'Rua dos Bobos, n. 0'
!set ze_sa_nc.idade := 42
!set ze_sa_nc.cartao := cartao_nc
!set ze_sa_nc.condicao := 'normal'
!set ze_sa_nc.apto := true

--a acao propriamente dita
? not(ze_sa_nc.registro->notEmpty())
-- O Famoso Ze Sa!

!insert (ze_sa_nc, br) into visita
--opcao de grupo
!create op_nc :opcao
!set op_nc.grupo := a

-- O registro do Ze Sa
!create registro_nc :registro
!insert (registro_nc, ze_sa_nc) into contem

!insert (ze_sa_nc, carteira_nc) into tem

--Reserva de Ze Sa
!create dReservaZe_nc : dataHora
!set	dReservaZe_nc.value := (20 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dReservaZe_nc.agora := agora

!create dDevZe_nc : dataHora
!set	dDevZe_nc.value := (23 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dDevZe_nc.agora := agora

? not(ze_sa_nc.registro.listaNegra())
? not(op_nc.grupo.isUndefined())
? jujuba.reserva->size() < jujuba.carro->size()
? ze_sa_nc.reserva->select(r : reserva | (r.dataHora_reserva.toDay() > dReservaZe_p.toDay() and r.dataHora_reserva.toDay() < dDevZe_p.toDay()) or (r.dataHora_devolucao.toDay() > dReservaZe_p.toDay() and r.dataHora_devolucao.toDay() < dDevZe_p.toDay()) and (dReservaZe_p.toDay() > r.dataHora_reserva.toDay() and dReservaZe_p.toDay() < r.dataHora_devolucao.toDay()) or (dDevZe_p.toDay() > r.dataHora_reserva.toDay() and dDevZe_p.toDay() < r.dataHora_devolucao.toDay()))->isEmpty()
!create reservaZe_nc : reserva between (ze_sa_nc, jujuba)
!set	reservaZe_nc.dataHora_reserva := dReservaZe_nc
!set	reservaZe_nc.dataHora_devolucao := dDevZe_nc


--Cenário com capacidade insuficiente
--data da emissao do CC
!create emissaoCC_ci:dataHora
!set emissaoCC_ci.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCC_ci.agora := agora

--validade do CC
!create validCC_ci:dataHora
!set validCC_ci.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCC_ci.agora := agora

--data da emissao da carteira
!create emissaoCarteira_ci:dataHora
!set emissaoCarteira_ci.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCarteira_ci.agora := agora

--validade da carteira
!create validCarteira_ci:dataHora
!set validCarteira_ci.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCarteira_ci.agora := agora

!create carteira_ci:carteira_habilitacao
!set carteira_ci.emissao := emissaoCarteira_ci
!set carteira_ci.validade := validCarteira_ci

--o CC do Ze Sa
!create cartao_ci:CC
!set cartao_ci.possuidor := 'ze_sa'
!set cartao_ci.disponibilidade := 10000.0
!set cartao_ci.numero := '123456781234'
!set cartao_ci.validade := validCC_ci
!set cartao_ci.emissao := emissaoCC_ci

-- O Famoso Ze Sa!
!create ze_sa_ci :cliente
!set ze_sa_ci.nome := 'Ze Sa'
!set ze_sa_ci.cpf := '11111111111'
!set ze_sa_ci.endereco := 'Rua dos Bobos, n. 0'
!set ze_sa_ci.idade := 42
!set ze_sa_ci.cartao := cartao_ci
!set ze_sa_ci.condicao := 'normal'
!set ze_sa_ci.apto := true
!insert (ze_sa_ci, carteira_ci) into tem

--opcao de grupo
!create op_ci :opcao
!set op_ci.grupo := a

-- O registro do Ze Sa
!create registro_ci :registro
!insert (registro_ci, ze_sa_ci) into contem

--Reserva de Ze Sa
!create dReservaZe_ci :dataHora
!set	dReservaZe_ci.value := (20 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dReservaZe_ci.agora := agora

!create dDevZe_ci :dataHora
!set	dDevZe_ci.value := (23 * 60) + (3 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set	dDevZe_ci.agora := agora

!insert (ze_sa_ci, br) into visita

--a acao propriamente dita
? ze_sa_ci.registro->notEmpty()
? not(ze_sa_ci.registro.listaNegra())
? not(op_ci.grupo.isUndefined())
? jujuba.reserva->size() >= jujuba.carro->size()
