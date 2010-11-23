!create agora:dataHora
!set agora.value := (23 * 60) + (11 * 30 * 24 * 60) + (2010 * 365 * 24 * 60)
!set agora.agora := agora

!create emissaoCC:dataHora
!set emissaoCC.value := (16 * 60) + (7 * 30 * 24 * 60) + (2007 * 365 * 24 * 60)
!set emissaoCC.agora := agora

!create validCC:dataHora
!set validCC.value := (14 * 60) + (7 * 30 * 24 * 60) + (2011 * 365 * 24 * 60)
!set validCC.agora := agora

!create cartao:CC
!set cartao.possuidor := 'ze_sa'
!set cartao.disponibilidade := 10000.00
!set cartao.numero := 1234 5678 1234
!set cartao.validade := validCC
!set cartao.emissao := emissaoCC

