{application, cache_server, [
	{description, ""},
	{vsn, "0.1.0"},
	{id, "04f5632-dirty"},
	{modules, ['api_handler','cache_server_app','cache_server_sup','storage']},
	{registered, [cache_server_sup]},
	{applications, [
		kernel,
		stdlib,
		cowboy,
		jsx
	]},
	{mod, {cache_server_app, []}},
	{env, []}
]}.
