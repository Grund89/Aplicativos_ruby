# Organizar uma fila de atendimentos

class Cliente
  attr_accessor :id, :tempo_de_chegada, :tempo_de_atendimento, :tempo_de_inicio, :tempo_de_saida

  def initialize(id, tempo_de_chegada, tempo_de_atendimento)
    @id = id
    @tempo_de_chegada = tempo_de_chegada
    @tempo_de_atendimento = tempo_de_atendimento
    @tempo_de_inicio = nil  # Quando o atendimento realmente começa
    @tempo_de_saida = nil   # Quando o atendimento realmente termina
  end
end

class FilaDeAtendimento
  attr_accessor :fila, :tempo_atual, :clientes_atendidos

  def initialize
    @fila = []
    @tempo_atual = 0
    @clientes_atendidos = []
  end

   # Adiciona clientes na fila
  def adicionar_cliente(cliente)
    @fila << cliente
  end

 # Processa a fila de atendimento
  def processar_fila
    until @fila.empty?
    cliente = @fila.shift
    cliente.tempo_de_inicio = [@tempo_atual, cliente.tempo_de_chegada].max
    cliente.tempo_de_saida = cliente.tempo_de_inicio + cliente.tempo_de_atendimento
    @tempo_atual = cliente.tempo_de_saida
    @clientes_atendidos << cliente
  end

  def gerar_tempo_de_chegada
    rand(1..3)  # Gera um tempo aleatório para a chegada do próximo cliente
  end

  def gerar_tempo_de_atendimento
    rand(1..5)  # Gera um tempo aleatório para o atendimento de um cliente
  end
end

class Estatisticas
  def self.calcular(fila)
    total_espera = 0
    total_sistema = 0
    ocupacao_servidor = 0

    fila.clientes_atendidos.each do |cliente|
      tempo_espera = cliente.tempo_de_inicio - cliente.tempo_de_chegada
      tempo_sistema = cliente.tempo_de_saida - cliente.tempo_de_chegada

      total_espera += tempo_espera
      total_sistema += tempo_sistema
      ocupacao_servidor += cliente.tempo_de_atendimento
    end

    media_espera = total_espera.to_f / fila.clientes_atendidos.size
    media_sistema = total_sistema.to_f / fila.clientes_atendidos.size
    taxa_ocupacao = ocupacao_servidor.to_f / fila.tempo_atual * 100

    {
      media_espera: media_espera,
      media_sistema: media_sistema,
      taxa_ocupacao: taxa_ocupacao
    }
  end
end

# Configuração inicial
fila = FilaDeAtendimento.new
total_clientes = 10  # Número de clientes para a simulação
tempo_de_chegada = 0
