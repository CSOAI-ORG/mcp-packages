export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function verify_provenance(params: { system_name: string; verification_type: string }): Promise<McpResult>;
  export function attest_compliance(params: { system_id: string; framework: string }): Promise<McpResult>;
  export function audit_lineage(params: { model_id: string; audit_scope: string }): Promise<McpResult>;
  export function generate_certificate(params: { scope: string; certification_level: string }): Promise<McpResult>;
};
