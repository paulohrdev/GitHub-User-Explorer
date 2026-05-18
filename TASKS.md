# GitHub User Explorer — Plano de Tasks (Flutter)

> Plano de execução enxuto, com arquitetura MVVM oficial do time do Flutter, Signals para estado e Hive para persistência.

---

## 📦 Stack

| Camada | Escolha                             | Justificativa                                                                 |
|---|-------------------------------------|-------------------------------------------------------------------------------|
| Linguagem | **Dart** + **Flutter**              | Domínio da tecnologia                                                         |
| Arquitetura | **MVVM** (guia oficial Flutter)     | Recomendação atual do time do Flutter — UI / ViewModel / Repository / Service |
| Estado | **signals_flutter**                 | Reatividade fina, API minimalista, sem boilerplate de Bloc                    |
| HTTP | **`dio`** (package oficial)         | API simples, sem interceptors complexos; suficiente para o escopo             |
| Persistência | **Hive** (`hive_ce` recomendado)    | Rápido, sem schema SQL, ideal para o histórico                                |
| Roteamento | **`go_router`**                     | Padrão atual recomendado pelo time do Flutter                                 |
| URLs externas | **`url_launcher`**                  | Abrir links no navegador do sistema                                           |
| Datas | **`intl`** ou **`timeago`**         | Formatação de datas relativas                                                 |
| Testes | **`flutter_test`** + **`mocktail`** | Padrão da comunidade                                                          |

> **Por que não Clean Architecture estrita aqui:** o desafio pede separação mínima de responsabilidades. MVVM oficial do Flutter atende isso com menos camadas (sem use cases, sem `Either`, sem mappers DTO↔Entity).

---

## 🗂 Estrutura de pastas (MVVM Flutter)

```
lib/
  config/                          # constantes, env, urls
  data/
    repositories/
      user_repository.dart         # contrato + impl
      history_repository.dart
    services/
      github_api_service.dart      # http client
      hive_service.dart            # bootstrap do Hive
  domain/
    models/
      user.dart                    # GithubUser (com fromJson)
      repository.dart              # GithubRepository (com fromJson)
      history_entry.dart           # @HiveType
  ui/
    core/
      themes/
      widgets/                     # shared (Avatar, ErrorView, EmptyView)
    search/
      view_model/
        search_view_model.dart
      widgets/
      search_screen.dart
    profile/
      view_model/
      widgets/
      profile_screen.dart
    repository/
      view_model/
      repository_screen.dart
    history/
      view_model/
      history_screen.dart
  routing/
    router.dart                    # go_router
  main.dart
```

---

## ⏱ Estimativa total

| Cenário | Tempo | Ritmo |
|---|---|---|
| Focado, sem polimento extra | 14–18h | 2 dias |
| Realista com testes e README | 20–25h | 3 dias |
| Polido + cobertura ampla | 28–32h | ~4 dias |

---

## Fase 0 — Setup ⏱ 0.5–1h

- [ ] Criar repositório público `github-user-explorer-flutter`
- [ ] `flutter create github_user_explorer` (com Android + iOS)
- [ ] Adicionar dependências no `pubspec.yaml`:
  - [ ] `signals_flutter`
  - [ ] `http`
  - [ ] `hive_ce` + `hive_ce_flutter`
  - [ ] `go_router`
  - [ ] `url_launcher`
  - [ ] `timeago` (ou `intl`)
- [ ] Dev dependencies:
  - [ ] `mocktail`
  - [ ] `hive_ce_generator` + `build_runner`
- [ ] Pinning de versões (estratégia do candidato)
- [ ] `.gitignore` revisado (Flutter padrão)
- [ ] Esqueleto do `README.md`
- [ ] Commit: `chore: initial project setup`

---

## Fase 1 — Estrutura e arquitetura MVVM ⏱ 1–2h

- [ ] Criar estrutura de pastas conforme seção acima
- [ ] `main.dart`: inicialização do Hive, registro de adapters, abertura da box
- [ ] Configurar `go_router` em `routing/router.dart` com as 4 rotas:
  - [ ] `/` → `SearchScreen`
  - [ ] `/profile/:username` → `ProfileScreen`
  - [ ] `/profile/:username/repo/:repo` → `RepositoryDetailsScreen`
  - [ ] `/history` → `HistoryScreen`
- [ ] Tema básico em `ui/core/themes`
- [ ] Widgets compartilhados base (`ErrorView`, `EmptyView`, `LoadingView`)
- [ ] Commit: `feat: setup MVVM structure with routing and theme`

---

## Fase 2 — Camada de dados ⏱ 2–3h

### Models
- [ ] `User` com `fromJson` (campos: login, name, bio, avatarUrl, followers, following, publicRepos, htmlUrl)
- [ ] `Repository` com `fromJson` (campos: id, name, description, language, stargazersCount, openIssuesCount, createdAt, updatedAt, htmlUrl, owner)
- [ ] `HistoryEntry` anotada com `@HiveType` (campos: username, name, avatarUrl, viewedAt)
- [ ] Rodar `build_runner` para gerar adapters

### Service de API
- [ ] `GithubApiService` com métodos:
  - [ ] `Future<User> getUser(String username)`
  - [ ] `Future<List<Repository>> getUserRepos(String username)`
  - [ ] `Future<Repository> getRepo(String owner, String repo)`
- [ ] Exceptions tipadas: `UserNotFoundException`, `RateLimitException`, `NetworkException`
- [ ] Tratamento de status:
  - [ ] 200 → parse
  - [ ] 404 → `UserNotFoundException`
  - [ ] 403 com `X-RateLimit-Remaining: 0` → `RateLimitException`
  - [ ] Outros → `NetworkException`

### Service do Hive
- [ ] `HiveService` com init/registro de adapters e abertura de box

### Repositories
- [ ] `UserRepository`:
  - [ ] `getUser(username)` → delega ao service
  - [ ] `getUserRepos(username)`
  - [ ] `getRepo(owner, repo)`
- [ ] `HistoryRepository`:
  - [ ] `addEntry(HistoryEntry)` — dedup por username, atualiza `viewedAt` se já existe
  - [ ] `getAll()` — ordenado por `viewedAt` desc
  - [ ] `clear()` (opcional)

- [ ] Commit: `feat: add data layer with api service, hive storage and repositories`

---

## Fase 3 — ViewModels com Signals ⏱ 1–2h

Padrão geral por ViewModel: signals individuais para `isLoading`, `error`, e o dado principal. Método público dispara a operação e atualiza os signals.

- [ ] `SearchViewModel`:
  - [ ] `isLoading`, `error`, `user` (signals)
  - [ ] `search(username)` → trata vazio, dispara service, captura exceptions
- [ ] `ProfileViewModel`:
  - [ ] `isLoadingUser`, `isLoadingRepos`, `error`, `user`, `repositories`
  - [ ] `load(username)` → busca em paralelo (user + repos), registra no histórico ao concluir
  - [ ] Computed signals para repos filtrados/ordenados
  - [ ] `searchText` e `sortBy` (mais recentes / mais stars) como signals
- [ ] `RepositoryDetailsViewModel`:
  - [ ] `isLoading`, `error`, `repository`
  - [ ] `load(owner, repo)`
- [ ] `HistoryViewModel`:
  - [ ] `entries` (signal<List<HistoryEntry>>)
  - [ ] `load()` — lê do Hive

- [ ] Commit: `feat: add view models with signals state management`

---

## Fase 4 — Tela de busca ⏱ 1–2h

- [ ] `SearchScreen` com `TextField` controlado
- [ ] `Watch` widget consumindo `SearchViewModel`
- [ ] Estados visuais:
  - [ ] Idle (campo vazio)
  - [ ] Loading (`CircularProgressIndicator`)
  - [ ] Sucesso (preview com avatar + login)
  - [ ] Usuário não encontrado (mensagem clara)
  - [ ] Erro de rede (mensagem + retry)
  - [ ] Rate limit (mensagem específica)
- [ ] Validação: input vazio não dispara busca
- [ ] Debounce simples (300–500ms) com `Timer`
- [ ] Tocar no resultado → `context.push('/profile/$username')`
- [ ] Botão para acessar `/history`

- [ ] Commit: `feat: implement search screen`

---

## Fase 5 — Tela de perfil ⏱ 1–2h

- [ ] `ProfileScreen` recebe `username` via parâmetro de rota
- [ ] Chamar `viewModel.load(username)` no `initState`
- [ ] Exibir todos os 8 campos obrigatórios:
  - [ ] Avatar (`CircleAvatar`)
  - [ ] Nome (com fallback para `login`)
  - [ ] Username
  - [ ] Bio (condicional)
  - [ ] Followers
  - [ ] Following
  - [ ] Public repos
  - [ ] Botão "Abrir no GitHub" → `url_launcher`
- [ ] Salvar no histórico automaticamente ao carregar com sucesso
- [ ] Loading e error states
- [ ] Seção embutida com a lista de repositórios (próxima fase)

- [ ] Commit: `feat: implement profile screen with history tracking`

---

## Fase 6 — Lista de repositórios ⏱ 2–3h

- [ ] Componente `RepositoryListItem` exibindo:
  - [ ] Nome
  - [ ] Descrição (condicional)
  - [ ] Linguagem (badge com bolinha colorida; condicional)
  - [ ] Stars
  - [ ] `updated_at` formatada (`timeago`)
- [ ] Campo de busca por nome (signal `searchText`)
- [ ] Toggle de ordenação: mais recentes / mais stars (signal `sortBy`)
- [ ] Computed signal aplicando filtro + ordenação sobre `repositories`
- [ ] `ListView.builder` consumindo o computed
- [ ] Empty state quando não há repos
- [ ] Tocar item → `context.push('/profile/$username/repo/${repo.name}')`

- [ ] Commit: `feat: implement repositories list with filter and sort`

---

## Fase 7 — Detalhes do repositório ⏱ 1h

- [ ] `RepositoryDetailsScreen` recebe `owner` e `repo` via params
- [ ] `viewModel.load(owner, repo)` no `initState`
- [ ] Exibir os 8 campos obrigatórios:
  - [ ] Nome
  - [ ] Descrição
  - [ ] Linguagem
  - [ ] Stars
  - [ ] Open issues
  - [ ] Data de criação
  - [ ] Data da última atualização
  - [ ] Botão "Abrir no GitHub" → `url_launcher`
- [ ] Loading e error states

- [ ] Commit: `feat: implement repository details screen`

---

## Fase 8 — Histórico ⏱ 1–2h

- [ ] `HistoryScreen` carrega entries no `initState`
- [ ] `ListView` com itens exibindo:
  - [ ] Avatar
  - [ ] Nome ou username
  - [ ] `viewedAt` formatado (tempo relativo)
- [ ] Tocar item → `context.push('/profile/$username')`
- [ ] Empty state "Nenhum perfil visualizado ainda"
- [ ] Persistência confirmada: fechar e reabrir o app deve manter os dados
- [ ] **Opcional:** botão para limpar histórico
- [ ] **Opcional:** dismiss para remover entry individual

- [ ] Commit: `feat: implement history screen with hive persistence`

---

## Fase 9 — Polimento ⏱ 1–2h

- [ ] `ErrorView` consistente nas telas com erro
- [ ] `LoadingView` (skeleton ou indicator) consistente
- [ ] Pull-to-refresh nas listas (`RefreshIndicator`)
- [ ] Mensagem específica para rate limit em todas as telas afetadas
- [ ] Validar comportamento offline (histórico deve continuar funcionando)
- [ ] Revisar nomenclatura de arquivos, classes e métodos
- [ ] Status bar e tema dark/light básico

- [ ] Commit: `chore: polish ux states and naming`

---

## Fase 10 — Testes ⏱ 3–4h

### Unitários
- [ ] `GithubApiService`:
  - [ ] Happy path (200)
  - [ ] 404 → `UserNotFoundException`
  - [ ] 403 rate limit → `RateLimitException`
  - [ ] Erro genérico → `NetworkException`
- [ ] `UserRepository`: garante que delega ao service corretamente (mock)
- [ ] `HistoryRepository`:
  - [ ] Adicionar entry
  - [ ] Deduplicar entry existente (atualiza `viewedAt`)
  - [ ] Listar ordenado por `viewedAt` desc
  - [ ] Limpar (se implementado)

### ViewModels
- [ ] `SearchViewModel`:
  - [ ] Não dispara busca com input vazio
  - [ ] Transições de estado: idle → loading → success
  - [ ] Trata `UserNotFoundException`
  - [ ] Trata `RateLimitException`
- [ ] `ProfileViewModel`:
  - [ ] Carrega user + repos em paralelo
  - [ ] Registra entry no histórico ao concluir
  - [ ] Computed de repos respeita filtro e ordenação
- [ ] `RepositoryDetailsViewModel`:
  - [ ] Happy path e error
- [ ] `HistoryViewModel`:
  - [ ] Carrega entries do repository

### Modelos
- [ ] `User.fromJson` com payload real da API
- [ ] `Repository.fromJson` com payload real
- [ ] `HistoryEntry` serialização/deserialização do Hive

- [ ] Rodar `flutter test --coverage` e incluir badge/sumário no README
- [ ] Commit: `test: add unit tests for services, repositories and view models`

---

## Fase 11 — Documentação e entrega ⏱ 1–2h

### README.md
- [ ] Descrição do projeto
- [ ] Stack utilizada com justificativa
- [ ] Setup do ambiente (Flutter version, FVM se usar)
- [ ] Como instalar (`flutter pub get`, `dart run build_runner build`)
- [ ] Como rodar (`flutter run` com flavors iOS/Android)
- [ ] Como rodar testes (`flutter test`)
- [ ] Arquitetura (MVVM oficial do Flutter — diagrama ou descrição em camadas)
- [ ] Decisões técnicas:
  - [ ] Por que MVVM (e não Clean Arch estrita)
  - [ ] Por que Signals (e não Bloc)
  - [ ] Por que Hive (e não SQLite)
  - [ ] Por que `http` (e não Dio)
- [ ] Screenshots:
  - [ ] Busca (idle, loading, not found, success)
  - [ ] Perfil
  - [ ] Lista de repos
  - [ ] Detalhes do repo
  - [ ] Histórico

### Entrega
- [ ] Gerar screenshots no emulador iOS + Android
- [ ] Revisar histórico de commits (Conventional Commits)
- [ ] Tag `v1.0.0`
- [ ] Push final
- [ ] Enviar link

- [ ] Commit: `docs: add README with setup, architecture and screenshots`

---

## 📅 Cronograma sugerido (3 dias)

| Dia | Fases | Entregável |
|---|---|---|
| 1 | Fases 0–3 | Estrutura + data layer + view models funcionando |
| 2 | Fases 4–8 | Todas as 4 telas implementadas e navegáveis |
| 3 | Fases 9–11 | Polimento + testes + README + entrega |

---

## ✅ Checklist de requisitos do desafio

### Obrigatórios
- [ ] Pesquisa com tratamento de: encontrado, não encontrado, vazio, loading
- [ ] Perfil com os 8 campos obrigatórios
- [ ] Lista de repositórios com 5 campos por item
- [ ] Filtro/ordenação (busca por nome + ordenar por stars/recentes)
- [ ] Detalhes do repositório com 8 campos obrigatórios
- [ ] Link do repo abre no navegador
- [ ] Histórico com avatar, nome/username, data/hora
- [ ] Histórico persiste entre execuções (Hive)
- [ ] Item do histórico reabre o perfil

### Técnicos
- [ ] Roda em iOS e/ou Android
- [ ] Consome API real do GitHub
- [ ] Navegação entre telas (`go_router`)
- [ ] Persistência local (Hive)
- [ ] Estrutura clara (MVVM)
- [ ] Separação de responsabilidades (UI / ViewModel / Repository / Service)
- [ ] Tratamento básico de erros
- [ ] Sem chamadas redundantes à API
- [ ] Nomenclatura clara

### Bônus
- [ ] Testes unitários (services, repositories, view models)
- [ ] Commits organizados (Conventional Commits)

### Entrega
- [ ] Repositório público
- [ ] `README.md` completo com setup, stack, arquitetura, prints
- [ ] `.gitignore` adequado
