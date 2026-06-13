export interface McpResult {
  content: Array<{ type: string; text: string }>;
}

export declare const server: {
  export function assess_compliance(params: { system_name: string; regulation: string }): Promise<McpResult>;
  export function audit_authenticity(params: { avatar_id: string; check_type: string }): Promise<McpResult>;
  export function detect_deepfake(params: { media_id: string; analysis_type: string }): Promise<McpResult>;
  export function generate_report(params: { scope: string; format: string }): Promise<McpResult>;
};
