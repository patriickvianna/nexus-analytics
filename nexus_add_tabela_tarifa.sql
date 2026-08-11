-- Nexus Analytics 2.0 — Adicionar coluna de tarifas nas filiais
-- Execute no Supabase SQL Editor (Dashboard → SQL Editor → New query)
-- Seguro para rodar múltiplas vezes (IF NOT EXISTS)

ALTER TABLE public.na_filiais
  ADD COLUMN IF NOT EXISTS tabela_tarifa JSONB;

COMMENT ON COLUMN public.na_filiais.tabela_tarifa IS
  'Estrutura de tarifas por tipo de veículo. Exemplo:
   {
     "carro": {
       "modelo": "complexo",
       "teto_diaria": 36.00,
       "faixas": [
         {"ate_min": 30, "valor": 8.00},
         {"ate_min": 60, "valor": 17.00}
       ],
       "fracao_min": 30,
       "fracao_valor": 3.00
     },
     "moto": {
       "modelo": "fixo",
       "valor_fixo": 10.00
     }
   }';
