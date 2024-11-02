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
