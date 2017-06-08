/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.modelo;

/**
 *
 * @author Carina Esthela
 */
public class Usuario {

    /**
     * @return the nip
     */
    public String getNip() {
        return nip;
    }

    /**
     * @param nip the nip to set
     */
    public void setNip(String nip) {
        this.nip = nip;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the graduacao
     */
    public int getGraduacao() {
        return graduacao;
    }

    /**
     * @param graduacao the graduacao to set
     */
    public void setGraduacao(int graduacao) {
        this.graduacao = graduacao;
    }

    /**
     * @return the graduacaoNome
     */
    public String getGraduacaoNome() {
        return graduacaoNome;
    }

    /**
     * @param graduacaoNome the graduacaoNome to set
     */
    public void setGraduacaoNome(String graduacaoNome) {
        this.graduacaoNome = graduacaoNome;
    }

    /**
     * @return the guerra
     */
    public String getGuerra() {
        return guerra;
    }

    /**
     * @param guerra the guerra to set
     */
    public void setGuerra(String guerra) {
        this.guerra = guerra;
    }

    /**
     * @return the setor
     */
    public String getSetor() {
        return setor;
    }

    /**
     * @param setor the setor to set
     */
    public void setSetor(String setor) {
        this.setor = setor;
    }

    /**
     * @return the ramal
     */
    public String getRamal() {
        return ramal;
    }

    /**
     * @param ramal the ramal to set
     */
    public void setRamal(String ramal) {
        this.ramal = ramal;
    }

    /**
     * @return the lotus
     */
    public String getLotus() {
        return lotus;
    }

    /**
     * @param lotus the lotus to set
     */
    public void setLotus(String lotus) {
        this.lotus = lotus;
    }

    /**
     * @return the tipoAcesso
     */
    public int getTipoAcesso() {
        return tipoAcesso;
    }

    /**
     * @param tipoAcesso the tipoAcesso to set
     */
    public void setTipoAcesso(int tipoAcesso) {
        this.tipoAcesso = tipoAcesso;
    }

    /**
     * @return the acesso
     */
    public int getAcesso() {
        return acesso;
    }

    /**
     * @param acesso the acesso to set
     */
    public void setAcesso(int acesso) {
        this.acesso = acesso;
    }

    /**
     * @return the lastAccess
     */
    public String getLastAccess() {
        return lastAccess;
    }

    /**
     * @param lastAccess the lastAccess to set
     */
    public void setLastAccess(String lastAccess) {
        this.lastAccess = lastAccess;
    }

    /**
     * @return the ativo
     */
    public int getAtivo() {
        return ativo;
    }

    /**
     * @param ativo the ativo to set
     */
    public void setAtivo(int ativo) {
        this.ativo = ativo;
    }

    /**
     * @return the statusSenha
     */
    public int getStatusSenha() {
        return statusSenha;
    }

    /**
     * @param statusSenha the statusSenha to set
     */
    public void setStatusSenha(int statusSenha) {
        this.statusSenha = statusSenha;
    }

    /**
     * @return the ip_access
     */
    public String getIp_access() {
        return ip_access;
    }

    /**
     * @param ip_access the ip_access to set
     */
    public void setIp_access(String ip_access) {
        this.ip_access = ip_access;
    }

    /**
     * @return the id_session
     */
    public String getId_session() {
        return id_session;
    }

    /**
     * @param id_session the id_session to set
     */
    public void setId_session(String id_session) {
        this.id_session = id_session;
    }
       
    private String nip;
    private String senha;
    private String nome;
    private int graduacao;
    private String graduacaoNome;
    private String guerra;
    private String setor;
    private String ramal;
    private String lotus;
    private int tipoAcesso;
    private int acesso;
    private String lastAccess;
    private int ativo;
    private int statusSenha;
    private String ip_access;
    private String id_session;

}
