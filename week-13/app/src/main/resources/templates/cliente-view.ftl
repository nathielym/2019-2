<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Gerenciamento de Cliente</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark">
        <!-- Brand -->
        <a class="navbar-brand" href="#">App</a>

        <!-- Toggler/collapsibe Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar links -->
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Consumidor</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Pais</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container-fluid mt-3">
        <div class="card">
            <div class="card-header">
                <h3>Gerenciamento de Clientes</h3>
            </div>
            <div class="card-body">
                <div>

                <#if clienteAtual??>
                    <form method="post" action="/cliente/alterar">
                        <div class="float-right mt-1 mb-1">
                            <input type="submit" class="btn btn-warning" value="Alterar"></input>
                        </div>
                <#else>
                    <form method="post" action="/cliente/criar">
                        <div class="float-right mt-1 mb-1">
                            <input type="submit" class="btn btn-primary" value="Criar"></input>
                        </div>
                </#if>

                        <input type="hidden" name="id" value="${(clienteAtual.id)!}"></input>

                        <div class="form-group">
                            <label for="nome">Nome:</label>
                            <input value="${(clienteAtual.nome)!}" name="nome" type="text" class="form-control" id="nome">
                        </div>
                        <div class="form-group">
                            <label for="nome">Idade:</label>
                            <input value="${(clienteAtual.idade)!}" name="idade" type="text" class="form-control" id="idade">
                        </div>
                        <div class="form-group">
                            <label for="nome">Limite de Crédito:</label>
                            <input value="${(clienteAtual.limiteCredito)!}" name="limiteCredito" type="text" class="form-control" id="limiteCredito">
                        </div>
                        <div class="form-group">
                            <label for="sigla">Telefone:</label>
                            <input value="${(clienteAtual.telefone)!}" name="telefone" type="text" class="form-control" id="telefone">
                        </div>
                    </form>
                </div>

                <div class="mt-3">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th>Nome</th>
                                <th>Idade</th>
                                <th>Limite Crédito</th>
                                <th>Telefone</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#list listaPaises as pais>
                                <tr>
                                    <td>${cliente.nome}</td>
                                    <td>${cliente.idade}</td>
                                    <td>${cliente.limiteCredito}</td>
                                    <td>${cliente.telefone}</td>
                                    <td>
                                        <a href="/cliente/preparaAlterar/${cliente.id}" class="btn btn-warning">Alterar</a>
                                        <a href="/cliente/apagar/${cliente.id}" class="btn btn-danger">Excluir</a>
                                    </td>
                                </tr>
                            </#list>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer"></div>
        </div>
    </div>


    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>