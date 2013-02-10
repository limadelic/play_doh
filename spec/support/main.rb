def main
  @main ||= TOPLEVEL_BINDING.eval 'self'
end

def main.global
  fail 'ran global'
end


